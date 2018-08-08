import React from 'react'
import Board from 'react-trello'
//import {fetch} from 'whatwg-fetch'

const data = {
  lanes: [
    {
      id: 'lane1',
      title: 'Planned Tasks',
      label: '2/2',
      cards: [
        {id: 'Card1', title: 'Write Blog', description: 'Can AI make memes', label: '30 mins'},
        {id: 'Card2', title: 'Pay Rent', description: 'Transfer via NEFT', label: '5 mins', metadata: {sha: 'be312a1'}}
      ]
    },
    {
      id: 'lane2',
      title: 'Completed',
      label: '0/0',
      cards: []
    }
  ]
}

export default class TaskBoard extends React.Component {

  setState(value) {
    this.state = value;
    console.log('setState', value);
  }

  constructor(props) {
      super(props);

      this.state = {
        tasks: [],
      };
  }
  
  componentDidMount() {
    console.log('componentDidMount')    

    fetch('http://localhost:3000/api/v1/tasks.json')
      .then(function(response) {
        return response.json()
      }).then(function(json) {
        const jj = json['items']
        console.log('parsed json', jj)
        this.setState(jj);
      }).catch(function(ex) {
        console.log('parsing failed', ex)
      });
  }

  render() {
//    const { tasks } = this.state;
   console.log('renddder', this.state)
//    return <Board data={tasks} />

    return <Board data={data} />
  }
}