#NoEnv

; Options
LongPressAltEnabled := True


SendMode Input
SetKeyDelay, -1

LAltState := "Off" ; Off | Tapping | Pressing
RAltState := "Off"
QueuedKey := ""

#If (LAltState = "Tapping") || (RAltState = "Tapping")
    !a::QueuedKey := QueuedKey . "a"
    !b::QueuedKey := QueuedKey . "b"
    !c::QueuedKey := QueuedKey . "c"
    !d::QueuedKey := QueuedKey . "d"
    !e::QueuedKey := QueuedKey . "e"
    !f::QueuedKey := QueuedKey . "f"
    !g::QueuedKey := QueuedKey . "g"
    !h::QueuedKey := QueuedKey . "h"
    !i::QueuedKey := QueuedKey . "i"
    !j::QueuedKey := QueuedKey . "j"
    !k::QueuedKey := QueuedKey . "k"
    !l::QueuedKey := QueuedKey . "l"
    !m::QueuedKey := QueuedKey . "m"
    !n::QueuedKey := QueuedKey . "n"
    !o::QueuedKey := QueuedKey . "o"
    !p::QueuedKey := QueuedKey . "p"
    !q::QueuedKey := QueuedKey . "q"
    !r::QueuedKey := QueuedKey . "r"
    !s::QueuedKey := QueuedKey . "s"
    !t::QueuedKey := QueuedKey . "t"
    !u::QueuedKey := QueuedKey . "u"
    !v::QueuedKey := QueuedKey . "v"
    !w::QueuedKey := QueuedKey . "w"
    !x::QueuedKey := QueuedKey . "x"
    !y::QueuedKey := QueuedKey . "y"
    !z::QueuedKey := QueuedKey . "z"
#If

~LAlt::
    If (LAltState = "Off") {
        Send {Blind}{F14}
        LAltState := "Tapping"
        KeyWait, LAlt, T0.2
        If ErrorLevel {
            LAltState := "Pressing"
            If (QueuedKey != "") 
                Send, {Blind}%QueuedKey%
            If LongPressAltEnabled {
                KeyWait, LAlt
                If (A_PriorKey = "LAlt") 
                    Send, {LAlt}
            }
        } Else {
            If (QueuedKey = "" || (A_PriorKey != "LAlt" && GetKeyState(A_PriorKey, "P")))
                Send, {Blind}{vk1D}%QueuedKey%
            Else
                Send, {Blind}{LAlt DownR}%QueuedKey%{LAlt up}
        }
        QueuedKey := ""
        LAltState := "Off"
    }
    Return

~RAlt::
    If (RAltState = "Off") {
        Send {Blind}{F14}
        RAltState := "Tapping"
        KeyWait, RAlt, T0.2
        If ErrorLevel {
            RAltState := "Pressing"
            If (QueuedKey != "")
                Send, {Blind}%QueuedKey%
            If LongPressAltEnabled {
                KeyWait, RAlt
                If (A_PriorKey = "RAlt") 
                    Send, {RAlt}
            }
        } Else {
            If (QueuedKey = "" || (A_PriorKey != "LAlt" && GetKeyState(A_PriorKey, "P")))
                Send, {Blind}{vk1C}%QueuedKey%
            Else
                Send, {Blind}{RAlt DownR}%QueuedKey%{RAlt up}
        }
        QueuedKey := ""
        RAltState := "Off"
    }
    Return
