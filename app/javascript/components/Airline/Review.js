import React from "react";
import Rating from "../Rating/Rating";
import styled from "styled-components";

const Card = styled.div`
  border: 1px solid #efefef;
  background: #fff;
`

const RatingContainer = styled.div`
  background: #f8f8f8;
  border-radius: 4px;
  padding: 20px;
  margin: 20px 0 20px 0;
`

const RatingScore = styled.div`
  font-size: 18px;
  padding: 20px 0 20px 0;
`

const Title = styled.div`
  padding: 20px 0 0 0;
  font-size: 18px;
`

const Description = styled.div`
  padding: 0 0 20px 0;
  font-size: 14px;
`


const Review = (props) => {
  const { score, title, description } = props.attributes;

  return (
    <Card>
      <RatingContainer>
        <Rating score={score}/>
      </RatingContainer>
      <Title>{title}</Title>
      <Description>{description}</Description> 
    </Card>
  );
}

export default Review;
