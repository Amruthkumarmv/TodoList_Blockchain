pragma solidity ^0.5.0;
// SPDX-License-Identifier: UNLICENSED
contract TodoList{
    uint public taskCount=0;

    struct Task{
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string content,
        bool completed
    ); 

    event TaskCompleted(
        uint id,
        bool completed
    );
    // address payable owner;
  
    constructor() public {
        createTask("Check out dude");
        // owner = msg.sender;
    }

    function createTask(string memory _content) public {
        taskCount++;
        // require(msg.value ==  0.000002 ether );
        //   bool sent = owner.send(msg.value);
        // require(sent, "Failed to send Ether");
        tasks[taskCount] = Task(taskCount,_content,false);

         emit TaskCreated(taskCount, _content, false); 
    }

     function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }
} 
