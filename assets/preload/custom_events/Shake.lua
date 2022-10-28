function onEvent(name, value1, value2)
   if name == 'Shake' then
      cameraShake('camGame', tonumber(value1), tonumber(value2));
   end
end