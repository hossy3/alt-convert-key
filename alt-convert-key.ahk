#NoEnv

; Options
LongPressAltEnabled := True


SendMode Input
SetKeyDelay, -1

LAltState := "Off" ; Off | Tapping | Pressing
RAltState := "Off"
QueuedKey := ""

#If (LAltState = "Tapping") || (RAltState = "Tapping")
    a::QueuedKey := QueuedKey . "a"
    b::QueuedKey := QueuedKey . "b"
    c::QueuedKey := QueuedKey . "c"
    d::QueuedKey := QueuedKey . "d"
    e::QueuedKey := QueuedKey . "e"
    f::QueuedKey := QueuedKey . "f"
    g::QueuedKey := QueuedKey . "g"
    h::QueuedKey := QueuedKey . "h"
    i::QueuedKey := QueuedKey . "i"
    j::QueuedKey := QueuedKey . "j"
    k::QueuedKey := QueuedKey . "k"
    l::QueuedKey := QueuedKey . "l"
    m::QueuedKey := QueuedKey . "m"
    n::QueuedKey := QueuedKey . "n"
    o::QueuedKey := QueuedKey . "o"
    p::QueuedKey := QueuedKey . "p"
    q::QueuedKey := QueuedKey . "q"
    r::QueuedKey := QueuedKey . "r"
    s::QueuedKey := QueuedKey . "s"
    t::QueuedKey := QueuedKey . "t"
    u::QueuedKey := QueuedKey . "u"
    v::QueuedKey := QueuedKey . "v"
    w::QueuedKey := QueuedKey . "w"
    x::QueuedKey := QueuedKey . "x"
    y::QueuedKey := QueuedKey . "y"
    z::QueuedKey := QueuedKey . "z"
#If

LAlt::
    If (LAltState = "Off") {
        LAltState := "Tapping"
        KeyWait, LAlt, T0.2
        If ErrorLevel {
            LAltState := "Pressing"
            If (QueuedKey == "" && Not LongPressAltEnabled)
                Send, {Blind}{LAlt DownR}{F14}
            Else
                Send, {Blind}{LAlt DownR}%QueuedKey%
            KeyWait, LAlt
            Send, {LAlt up}
        } Else
            Send, {Blind}{vk1D}%QueuedKey%
        QueuedKey := ""
        LAltState := "Off"
    }
    Return

RAlt::
    If (RAltState = "Off") {
        RAltState := "Tapping"
        KeyWait, RAlt, T0.2
        If ErrorLevel {
            RAltState := "Pressing"
            If (QueuedKey == "" && Not LongPressAltEnabled)
                Send, {Blind}{RAlt DownR}{F14}
            Else
                Send, {Blind}{RAlt DownR}%QueuedKey%
            KeyWait, RAlt
            Send, {RAlt up}
        } Else
            Send, {Blind}{vk1C}%QueuedKey%
        QueuedKey := ""
        RAltState := "Off"
    }
