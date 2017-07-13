import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
          <Link to="/red" >Red</Link>
          <Link to="/green" >Green</Link>
          <Link to="/blue" >Blue</Link>
          <Link to="/violet" >Violet</Link>

        <div id="rainbow">
          <Route path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/violet" component={Violet} />
          <Route path="/blue" component={Blue} />
        </div>
      </div>
    );
  }
}

export default Rainbow;
