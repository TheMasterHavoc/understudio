/// @description Write

var c = string_char_at(text, currentPos);
if (currentPos < string_length(text) + 2) {
	switch (c) {
		case "`":
			var cNext = string_char_at(text, ++currentPos);
			switch (cNext) {
				case "p":
					var pauseCheck = string_char_at(text, ++currentPos);
					holdTimer = real(pauseCheck) * 10;
					currentPos++;
					break;
				case "E":
					var eventCheck = string_char_at(text, ++currentPos);
					global.writerEvent = real(eventCheck);
					currentPos++;
					break;
				default:
					written += "`" + cNext;
					while (string_char_at(text, currentPos + 1) != "`" && !completed)
						written += string_char_at(text, ++currentPos);
					written += "`";
					currentPos++;
					break;
			}
			break;
		default:
			written += c;		
			if (c != " ") {
				for (var n = 0; n < array_length(voice); n++) {
					audio_stop_sound(voice[n]);
					global.sfxManager.Play(voice[random(n)]);
				}
			}
			break;
	}
}
else completed = true;