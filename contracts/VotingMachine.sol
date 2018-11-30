pragma solidity ^0.4.2;


contract VotingMachine{

    // Store Candidates Count
  uint public candidatesCount=0;


    //structure to store candidate's details
  struct Candidate{
    uint candidateID;
    string name;
    uint voteCount;
  }



  // mapping to store candidates that have registered
  mapping( uint => Candidate ) public candidates;
  //voted
  mapping ( address => uint ) public voted;
  //mapping to store votes
  mapping ( uint => uint ) public record;

  //constructor
  function VotingMachine () public {
      addCandidate("Candidate 1");
      addCandidate("Candidate 2");
  }

  //add candidates
  function addCandidate (string _name) {
      uint cid = ++candidatesCount ;
      candidates[cid] = Candidate(cid, _name, 0);
  }


/*
*  //generate a secure hash
*  function hashPrivateKey(uint _privateKey) returns (uint){
*    return uint(keccak256(_privateKey));
  }
*/




  //vote using private key        only Voter
  function vote (uint _pk, uint _candidateId) public {

      // require that they haven't voted before
      require(voted[msg.sender]!=10);

      // require a valid candidate
      require(_candidateId > 0 && _candidateId <= candidatesCount);

      // update candidate vote Count
      candidates[_candidateId].voteCount ++;

      voted[msg.sender]=10;

      //update record
      record[uint(keccak256(_pk))]= _candidateId;

  }

  // check vote
  function checkVote(uint _pk) view returns (uint){
  if (voted[msg.sender]==10)
        return record[uint(keccak256(_pk))];
  else return 0;
  }


}
