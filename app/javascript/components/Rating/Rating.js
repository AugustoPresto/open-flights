import React from "react";
import './Rating.css'

const Rating = (props) => {
  const score = (props.score / 5) * 100;

  return (
    <div className="star-wrapper">
      <span className="stars" style={{width: score + "%"}}></span>
    </div>
  );
}

export default Rating;
