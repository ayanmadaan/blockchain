import React from "react";
import "./Main.css";
import nft from "./Frame2.png";
import card from "./Frame3.png";
import cryptos from "./Frame4.svg";
import Card from "../Card/Card";

function Main() {
  return (
    <div>
      <div className="nft-col">
        <h1>
          Use your <br />
          favourite NFT as <br /> your collateral
        </h1>
        <img className="nfts" src={nft} alt="nft" />
      </div>
      <div className="eg">
        <Card />
        <img src={cryptos} className="cryptos" />
        <h1 className="real">
          Get your desired <br /> crypto, secured <br /> against your NFT
        </h1>
      </div>
    </div>
  );
}

export default Main;
