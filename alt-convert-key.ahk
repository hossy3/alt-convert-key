#NoEnv

; Options
LongPressAltEnabled := True


SendMode Input

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
        SetTimer, OnTimeoutLAltTapping, -200
    }
    Return
*~LAlt Up::
    SetTimer, OnTimeoutLAltTapping, Off
    If (LAltState = "Tapping") {
        SetKeyDelay, -1
        Send, {Blind}{vk1D}%QueuedKey%
    } Else If (LongPressAltEnabled && LAltState = "Pressing" && A_Priorkey == "LAlt") {
        Send, {LAlt}
    }
    LAltState := "Off"
    QueuedKey := ""
    Return
OnTimeoutLAltTapping:
    If (LAltState = "Tapping") {
        LAltState := "Pressing"
        If (QueuedKey != "") {
            SetKeyDelay, -1
            Send, {Blind}%QueuedKey%
            QueuedKey := ""
        }
    }
    Return

~RAlt::
    If (RAltState = "Off") {
        Send {Blind}{F14}
        RAltState := "Tapping"
        SetTimer, OnTimeoutRAltTapping, -200
    }
    Return
*~RAlt Up::
    SetTimer, OnTimeoutRAltTapping, Off
    If (RAltState = "Tapping") {
        SetKeyDelay, -1
        Send, {Blind}{vk1C}%QueuedKey%
    } Else If (LongPressAltEnabled && RAltState = "Pressing" && A_Priorkey == "RAlt") {
        Send, {RAlt}
    } 
    RAltState := "Off"
    QueuedKey := ""
    Return
OnTimeoutRAltTapping:
    If (RAltState = "Tapping") {
        RAltState := "Pressing"
        If (QueuedKey != "") {
            SetKeyDelay, -1
            Send, {Blind}%QueuedKey%
            QueuedKey := ""
        }
    }
    Return
