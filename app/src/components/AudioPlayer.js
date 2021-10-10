import { useState, useEffect } from "react";
import { GoUnmute, GoMute } from "react-icons/go";

const useAudio = (url, playOnStart=true) => {
  const [audio] = useState(new Audio(url));
  const [playing, setPlaying] = useState(playOnStart);

  const toggle = () => setPlaying(!playing);

  useEffect(() => {
      playing ? audio.play() : audio.pause();
    },
    [playing, audio]
  );

  useEffect(() => {
    audio.addEventListener('ended', () => setPlaying(false));
    return () => {
      audio.removeEventListener('ended', () => setPlaying(false));
    };
  }, [audio]);

  return [playing, toggle];
};

export function AudioPlayer({ url }) {
  const [playing, toggle] = useAudio(url);

  return (
    <div className="audio-player">
      {!playing && <GoUnmute onClick={toggle}/>}
      {playing && <GoMute onClick={toggle}/>}
    </div>
  );
};
