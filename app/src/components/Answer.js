import { useState } from 'react'
import { colors } from "../colors"
import '../css/Answer.css'

export function Answer({word, onAnswer, color, isCorrect}) {
  const [bgColor, setBgColor] = useState("aliceblue")

  const handleClick = () => {
    setBgColor(isCorrect ? "green" : "red")
    setTimeout(() => {
      onAnswer(isCorrect)
    }, 1000);
  }

  const setColorTo = (color) => {
    if(bgColor === "green" || bgColor === "red") return
    else {
      setBgColor(color)
    }
  }

  return (
    <div
      className="answer"
      onMouseOver={() => setColorTo(colors[color])}
      onMouseLeave={() => setColorTo("aliceblue")}
      style={{backgroundColor: bgColor}}
      onClick={handleClick}>
      {word}
    </div>
  )
}
