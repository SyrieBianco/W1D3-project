import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

class Red extends React.Component {
  render() {
    return(
      <div>
        <h2 className="red"></h2>
        <NavLink exact to="/red">Red only</NavLink>
        <NavLink to="/red/yellow">Yellow</NavLink>
        <NavLink to="/red/orange">Orange</NavLink>


        <Route path="/red/yellow" component={Yellow} />
        <Route path="/red/orange" component={Orange} />
      </div>
    );
  }
}

export default Red;
