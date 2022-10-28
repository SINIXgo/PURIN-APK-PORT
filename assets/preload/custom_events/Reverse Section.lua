local reverseSection = false;
local reverseCamBop = false;

--[[

--i fucking hate psych enginge hscript it shoul burn!!!!!!!!!
function onUpdate(elapsed)
   --as you can tell this is the same code but the values go to a different value
   if reverseSection then
      --Icons.
      iplier = math.lerp(1.2, getProperty('iconP1.scale.x'), boundTo(1 - (elapsed * 9 * getProperty('playbackRate')), 0, 1.2));
   
      scaleObject('iconP1', iplier, iplier);
   
      scaleObject('iconP2', iplier, iplier);
      --Camera
   
      --istg if this doesnt work first try im gonna kms
      setPropertyFromClass('flixel.FlxG', 'camera.zoom', math.lerp(getProperty('defaultCamZoom') + 0.015 * getProperty('camZoomingMult'), getPropertyFromClass('flixel.FlxG', 'camera.zoom'), boundTo(1 - (elapsed * 3.125 * getProperty('camZoomingDecay') * getProperty('playbackRate')), 0, 1)))
      setProperty('camHUD.zoom', math.lerp(1 + 0.03 * getProperty('camZoomingMult'), getProperty('camHUD.zoom'), boundTo(1 - (elapsed * 3.125 * getProperty('camZoomingDecay') * getProperty('playbackRate')), 0, 1)));
   end
end

function onBeatHit() --reverse scar y boppin' !
   if reverseSection then
      scaleObject('iconP1', 1, 1);
   
      scaleObject('iconP2', 1, 1);
	  
	  if curBeat % 4 == 0 then
         setPropertyFromClass('flixel.FlxG', 'camera.zoom', getProperty('defaultCamZoom'));
	     setProperty('camHUD.zoom', 1);
      end
   end
end

--]]

function onBeatHit()
   if reverseSection then
      scaleObject('iconP1', 1, 1)
	  scaleObject('iconP2', 1, 1)

	  doTweenX('bruh1x', 'iconP1.scale', 1.2, (crochet / 1000) / playbackRate, 'circIn')
	  doTweenY('bruh1y', 'iconP1.scale', 1.2, (crochet / 1000) / playbackRate, 'circIn')
	  doTweenX('bruh2x', 'iconP2.scale', 1.2, (crochet / 1000) / playbackRate, 'circIn')
	  doTweenY('bruh2y', 'iconP2.scale', 1.2, (crochet / 1000) / playbackRate, 'circIn')
   end
end

function onSectionHit()
   if reverseSection and reverseCamBop then
      if getProperty('camZooming') and cameraZoomOnBeat then
		 setProperty('camGame.zoom', 2)
		 setProperty('camHUD.zoom', 1)
		
		 doTweenZoom('game', 'camGame', getPropertyFromClass('flixel.FlxG', 'camera.zoom') + (0.015 * getProperty('camZoomingMult')), ((crochet / 1000) * 4) / playbackRate, 'expoIn')
	     doTweenZoom('hud', 'camHUD', 1 + (0.03 * getProperty('camZoomingMult')), ((crochet / 1000) * 4) / playbackRate, 'expoIn')
	  end
   end
end


--Math functions for the icons. (No idea who made these :sob:)
function math.lerp(a,b,t)
 return(b-a) * t + a;
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value));
end

function onEvent(name, value1)
   local convertbool = {['true'] = true, ['false'] = false};
   
   if name == 'Reverse Section' then
      reverseSection = convertbool[value1];
   end
   
   if name == 'Reverse Cam Bop' then
      reverseCamBop = convertbool[value1];
   end
end

function onTweenCompleted(tag)
   if tag == 'camGameZoomInReverse' then
      reverseCamBop = true;
	  
      triggerEvent('Turn Off Cam Follow', 'true');
   end
end