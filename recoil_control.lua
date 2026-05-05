--[[
                      :::!~!!!!!:.
                  .xUHWH!! !!?M88WHX:.
                .X*#M@$!!  !X!M$$$$$$WWx:.
               :!!!!!!?H! :!$!$$$$$$$$$$8X:
              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!
             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
               !:~~~ .:!M"T#$$$$WX??#MRRMMM!
               ~?WuxiW*`   `"#$$$$8!!!!??!!!
             :X- M$$$$       `"T#$T~!8$WUXU~
            :%`  ~#$$$m:        ~!~ ?$$$$$$
          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"
.....   -~~:<` !    ~?T#$$@@W@*?$$      /`
W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :
#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~
.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `
Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!
$R@i.~~ !     :   ~$$$$$B$$en:``
?MXT@Wx.~    :     ~"##*$$$$M~

--]]




---                              R E C O I L  C O N T R O L                               ----


EnableRCS = true --- When Set to false, it'll turn off Recoil Control!

RecoilControlMode = "ASH" --- Presets: "Low", "Medium", "High", "Ultra", "Insanity", "ASH", "BUCK", "Custom"

RcCustomStrength = 7 -- Value MUST be ROUNDED! No Decimal values such as 6.5!

RequireToggle = true -- Change to false if you want it to always be on.

ToggleKey = "CapsLock" -- Usable Keys: "CapsLock", "NumLock", "ScrollLock"

DelayRate = 7 -- DO NOT CHANGE IF YOU DON'T KNOW WHAT YOU'RE DOING.


---                           H O R I Z O N T A L  R E C O I L                            ----

EnableHorizontalRCS = true -- Set to true to enable horizontal recoil compensation.

HorizontalRecoilMode = "" --- Presets: "Low", "Medium", "High", "Ultra", "Insanity", "Custom"
                            --- Leave "" to use the per-mode default set in Recoil Presets below.

HrCustomStrength = 2 -- Value MUST be ROUNDED! Positive = drift right, Negative = drift left.

---                                                                                         ----


--[[
       HOW TO USE FOR DUMBIES,
  (RC)
1: If the  "EnableRCS" is set to false, change to true.
2: Adjust your Recoil Control Strength, either by using a preset or a custom value!
3: Toggle it on (if you have ForceToggle enabled, else just do step 4.)
4: Hold Mouse1 and Mouse2 (LeftClick and RightClick) and it should drag your cursor downwards.
5: Aim at your target and your done!


  (Horizontal RC)
1: Set "EnableHorizontalRCS" to true.
2: Adjust "HorizontalRecoilMode" or use "Custom" with "HrCustomStrength".
3: Leave HorizontalRecoilMode = "" to use each mode's built-in horizontal default.
4: Positive values compensate for right drift, negative values for left drift.
5: Works alongside vertical recoil control automatically.




(Things to note)
1: I did NOT make the Recoil Control Code, I just simplified everything, so you can adjust it to your needs
2: You don't need to hold down your toggle key, its a toggle.
3: You must hold mouse1 and mouse2, or else IT WONT WORK!
4: DelayRate Works in MS, the lower the faster. 7ms = 0.07s, 2000ms = 2s. However the preset Delay rate is perfect for most FPS games.
5: Horizontal recoil compensation uses negative X movement to counteract rightward drift (and vice versa).
--]]




-------------  Recoil Presets ------
-- Each mode sets a default HorizontalRecoilStrength; the horizontal section below can override it.
if RecoilControlMode == "Low" then
  RecoilControlStrength = 2
  HorizontalRecoilStrength = 1
elseif RecoilControlMode == "Medium" then
  RecoilControlStrength = 6
  HorizontalRecoilStrength = 1
elseif RecoilControlMode == "High" then
  RecoilControlStrength = 8
  HorizontalRecoilStrength = 1
elseif RecoilControlMode == "Ultra" then
  RecoilControlStrength = 12
  HorizontalRecoilStrength = 1
elseif RecoilControlMode == "ASH" then
  RecoilControlStrength = 8
  HorizontalRecoilStrength = 0
elseif RecoilControlMode == "Insanity" then
  RecoilControlStrength = 31
  HorizontalRecoilStrength = 1
elseif RecoilControlMode == "BUCK" then
  RecoilControlStrength = 7
  HorizontalRecoilStrength = 0
elseif RecoilControlMode == "Custom" then
  RecoilControlStrength = RcCustomStrength
  HorizontalRecoilStrength = 0
end

-------------  Horizontal Recoil Presets ------
-- If EnableHorizontalRCS is false, force to 0.
-- If HorizontalRecoilMode is "" or unrecognized, the per-mode default above is kept.
if not EnableHorizontalRCS then
  HorizontalRecoilStrength = 0
elseif HorizontalRecoilMode == "Low" then
  HorizontalRecoilStrength = 1
elseif HorizontalRecoilMode == "Medium" then
  HorizontalRecoilStrength = 3
elseif HorizontalRecoilMode == "High" then
  HorizontalRecoilStrength = 5
elseif HorizontalRecoilMode == "Ultra" then
  HorizontalRecoilStrength = 8
elseif HorizontalRecoilMode == "Insanity" then
  HorizontalRecoilStrength = 15
elseif HorizontalRecoilMode == "Custom" then
  HorizontalRecoilStrength = HrCustomStrength
end
--------------------------------------

EnablePrimaryMouseButtonEvents  (true);
function OnEvent(event,arg)
if EnableRCS ~= false then
if RequireToggle ~= false then
    if IsKeyLockOn(ToggleKey)then
        if IsMouseButtonPressed(3)then
            repeat
                if IsMouseButtonPressed(1) then
                    repeat
                        MoveMouseRelative(HorizontalRecoilStrength,RecoilControlStrength)
                        Sleep(DelayRate)
                    until not IsMouseButtonPressed(1)
                end
            until not IsMouseButtonPressed(3)
        end
    end

else

        if IsMouseButtonPressed(3)then
            repeat
                if IsMouseButtonPressed(1) then
                    repeat
                        MoveMouseRelative(HorizontalRecoilStrength,RecoilControlStrength)
                        Sleep(DelayRate)
                    until not IsMouseButtonPressed(1)
                end
            until not IsMouseButtonPressed(3)
        end
    end
else
end
end
