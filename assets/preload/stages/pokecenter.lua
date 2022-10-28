local posXY = {-735, -500};

function onCreate()
   makeLuaSprite('floor', 'purin/8floor', posXY[1], posXY[2]);
   addLuaSprite('floor');
   
   makeLuaSprite('backlayer', 'purin/7backlayer', posXY[1], posXY[2]);
   setScrollFactor('backlayer', 0.98, 0.98);
   addLuaSprite('backlayer');
   
   makeLuaSprite('nursejoy', 'purin/6nursejoy', posXY[1] + 1260, posXY[2] + 674);
   setScrollFactor('nursejoy', 0.98, 0.98);
   addLuaSprite('nursejoy');
   
   makeLuaSprite('table', 'purin/5table', posXY[1], posXY[2]);
   setScrollFactor('table', 0.98, 0.98);
   addLuaSprite('table');

   makeAnimatedLuaSprite('stare', 'purin/Purin_Recolored', 544, 581);
   addAnimationByPrefix('stare', 'idle', 'Body0', 24, true);
   scaleObject('stare', 0.18, 0.18);
   setProperty('stare.visible', false);
   addLuaSprite('stare');
   
   makeAnimatedLuaSprite('static', 'purin/static', 252, 173);
   addAnimationByPrefix('static', 'idle', 'static idle0', 24, true);
   scaleObject('static', 1.4, 1.4);
   setProperty('static.antialiasing', false);
   setProperty('static.alpha', 0);
   addLuaSprite('static');
   
   makeAnimatedLuaSprite('statichud', 'purin/static', 252, 173);
   addAnimationByPrefix('statichud', 'idle', 'static idle0', 24, true);
   scaleObject('statichud', 5, 5);
   setProperty('statichud.antialiasing', false);
   setProperty('statichud.alpha', 0);
   setObjectCamera('statichud', 'camOther');
   screenCenter('statichud');
   addLuaSprite('statichud');
   
   makeLuaSprite('toplayer', 'purin/4toplayer', posXY[1], posXY[2]);
   setScrollFactor('toplayer', 1, 1);
   addLuaSprite('toplayer');
   
   makeLuaSprite('window', 'purin/3window', posXY[1], posXY[2]);
   addLuaSprite('window');
   
   makeLuaSprite('painting', 'purin/2painting', posXY[1], posXY[2]);
   addLuaSprite('painting');
   
   makeLuaSprite('darkoverlay', 'purin/1darknessoverlay', posXY[1], posXY[2]);
   addLuaSprite('darkoverlay', true);
end

function onCreatePost()
   nurseAngle = getProperty('nursejoy.angle');
   
   setProperty('nursejoy.origin.x', 75);
   setProperty('nursejoy.origin.y', 0);
end

function onUpdate()
   --Just like Sayori from DDLC.
   
   setProperty('nursejoy.angle', nurseAngle + math.sin((180 / math.pi) * ((getPropertyFromClass('Conductor', 'songPosition') / 1000) / 36)) * 3);
end