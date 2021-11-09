import React from "react";

class AddFriend extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      users: [],
    };
  }
  searchFriends = () => {
    var users = this.state.users;
    $(".ui.search").search({
      source: content,
      fields: {
        title: "email",
      },
    });
  };
  fetchFriends = (e) => {
    fetch("/email_list", {
      method: "GET",
    })
      .then((response) => response.json())
      .then((data) => {
        this.setState({ users: data });
      });
  };
  render() {
    console.log(props);
    console.log(this.state.users);
    return (
      <div>
        <div className="ui search">
          <div className="ui icon input">
            <input
              id="friendInput"
              onKeyUp={this.searchFriends}
              onClick={this.fetchFriends}
              className="prompt"
              type="text"
              placeholder="Search ..."
            />
            <i className="search icon"></i>
          </div>
          <div className="results"></div>
        </div>
      </div>
    );
  }
}

export default AddFriend;
