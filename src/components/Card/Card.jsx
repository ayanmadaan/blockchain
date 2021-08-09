import React, { useState } from "react";
import "./Card.css";
import punk from "./punk.png";

function Card() {
  //experiment
  const [people, setPeople] = useState([
    {
      name: "Punk",
      type: "0.5 ETH",
      info: "1% ROI | 15 Days",
    },
  ]);

  return (
    <div>
      <div className="card-container">
        {people.map((person) => (
          <div className="card">
            <img src={punk} alt="" class="card-img" />
            <div className="card-content">
              {/* <h1 className="title">Ayan Madaan</h1>
            <span className="type">Freshman</span>
            <p className="info">I like pizza and money</p> */}

              <h1 className="title">{person.name}</h1>
              <span className="type">{person.type}</span>
              <p className="info">{person.info}</p>

              <a href="#" className="btnn">
                Shoot
              </a>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Card;
