// var data = [
//     {id: 1, author: "Gandalf", text: "This is one comment"},
//     {id: 2, author: "Saruman", text: "This is other comment"},
// ];

var CommentBox = React.createClass({
    getInitialState: function() {
        return {data: []};
    },
    loadComponentsFromServer: function() {
        $.ajax({
            url: this.props.url,
            dataType: 'json',
            cache: false,
            success: function(data) {
                this.setState({data: data});
            }.bind(this),
            error: function(xhr, status, err) {
                console.error(this.props.url, status, err.toString());
            }.bind(this)
        });
    },

    componentDidMount: function() {
        this.loadComponentsFromServer();
        setInterval(this.loadComponentsFromServer, this.props.poolInterval);
    },
    render: function() {
        return (
            <div className="commentBox">
                <h1>Comments</h1>
                <CommentList data={this.state.data} />
                <CommentForm />
                </div>
        );
    }
});

var Comment = React.createClass({
    rawMarkup: function() {
        var md = new Remarkable();
        var rawMarkup = md.render(this.props.children.toString());
        return { __html: rawMarkup  };
    },
    render: function() {
        var md = new Remarkable;
        return (
            <div className="comment">
                <h2 className="commentAuthor">
                {this.props.author}
                </h2>
                <span dangerouslySetInnerHTML={this.rawMarkup()} />
                </div>
        );
    }
});

var CommentList = React.createClass({
    render: function() {

        var commentNodes = this.props.data.map(function(comment) {

            return (
                <Comment author={comment.author}>{comment.text}</Comment>
            );
        });

        return (
            <div className="commentList">
                {commentNodes}
                </div>
        );
    }
})

var CommentForm = React.createClass({
    render: function() {
        return (
            <div className="commentForm">
                Hello, world! I am a Comment Form.
                </div>
        );
    }
})


ReactDOM.render(
    <CommentBox url="/api/comments" poolInterval={20000} />,
    document.getElementById('content')
);
