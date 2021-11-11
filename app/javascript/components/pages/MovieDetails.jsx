import React from "react";
import "./Movie.styles.scss";
import * as Vibrant from "node-vibrant";

const MovieDetails = (props) => {
  return (
    <div
      className="contain"
      style={{
        backgroundImage: `url(https://image.tmdb.org/t/p/w500/${props.backdrop_path})`,
      }}
    >
      <img
        src={`https://image.tmdb.org/t/p/w500/${props.poster_path}`}
        className="poster"
        alt="..."
      />
      <div className="card">
        <h5 className="card-title ps-3 pt-3">{props.title}</h5>
        <div className="ui horizontal statistic m-3">
          <div className="value">{props.vote_average} Average</div>
        </div>
      </div>
    </div>
  );
};

export default MovieDetails;
