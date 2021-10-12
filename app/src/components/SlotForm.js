import { useState } from "react"

export function SlotForm({slot}) {
  const [quizType, setQuizType] = useState(slot.quiztype);
  const handleChange = ({target}) => {
    setQuizType(target.value);
  }

  return (
   <form className="slot-form" onSubmit={(e) => e.preventDefault()}>
    <select value={quizType} onChange={handleChange}>
      <option value="choose">Choose</option>
      <option value="choose-reverse">Choose reverse</option>
      <option value="type">Type</option>
      <option value="type-reverse">Type reverse</option>
    </select>
   </form>
  )
}
