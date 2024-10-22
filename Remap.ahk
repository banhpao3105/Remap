; Khởi tạo biến để theo dõi trạng thái phím
eightPressed := false
iPressed := false
kPressed := false
isRunning := false  ; Biến để theo dõi trạng thái của script

; Tạo GUI
Gui, Add, Text, vStatusText w150, Trạng thái: Bắt đầu
Gui, Add, Button, gStartScript w60, Bắt đầu
Gui, Add, Button, gPause w60 x+10, Tạm dừng
Gui, Show, w150, Remap
return

StartScript:
    isRunning := false
    GuiControl,, StatusText, Trạng thái: Đang chạy
    return

Pause:
    isRunning := true
    GuiControl,, StatusText, Trạng thái: Tạm dừng
return

8:: 
{
    if (!isRunning) return  ; Không thực hiện nếu script không chạy
    eightPressed := true
    Send, 8
    return
}

i:: 
{
    if (!isRunning) return  ; Không thực hiện nếu script không chạy
    if (eightPressed)
    {
        return
    }
    iPressed := true
    Send, i
    return
}

k:: 
{
    if (!isRunning) return  ; Không thực hiện nếu script không chạy
    if (iPressed)
    {
        return
    }
    kPressed := true
    Send, k
    return
}

,:: 
{
    if (!isRunning) return  ; Không thực hiện nếu script không chạy
    if (kPressed)
    {
        return
    }
    Send, ,
    return
}

8 up::
{
    eightPressed := false
    return
}

i up::
{
    iPressed := false
    return
}

k up::
{
    kPressed := false
    return
}

, up::
{
    return
}

; Xử lý thu nhỏ GUI về tray
GuiSize:
    if (A_EventInfo = 1)  ; Nếu bấm nút thu nhỏ (minimize)
    {
        Gui, Hide  ; Ẩn GUI
        Menu, Tray, Add, Show ; Tạo menu để hiển thị GUI lại
        Menu, Tray, Default, Show ;
        Menu, Tray, NoStandard  ; Xóa menu mặc định
        Menu, Tray, Add, Thoát, GuiClose  ; Thêm tùy chọn thoát
        ;Menu, Tray, Icon, Shell32.dll, 44  ; Đặt biểu tượng cho khay hệ thống
        Menu, Tray, Tip, Remap  ; Thêm tooltip cho biểu tượng khay hệ thống
        return
    }
return

Show:
    Gui, Show  ; Hiển thị lại GUI
return

GuiClose:
    ExitApp  ; Đóng ứng dụng khi đóng GUI    