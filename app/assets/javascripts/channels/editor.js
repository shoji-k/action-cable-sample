App.editor = App.cable.subscriptions.create({
  channel: "EditorChannel",
  name: 'main'
}, {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
   PAPER.ck.setData(data.content);
  },

  sync: function(content) {
    return this.perform('sync', {
      content: content
    });
  }
});

$(function() {
  $('#sync').on('click', function() {
    var content = PAPER.ck.getData();
    App.editor.sync(content);
  });

  $('#add').on('click', function() {
    PAPER.count++;
    var name = "editor" + PAPER.count;
    $('#add').after('<div><textarea name="'+name+'" id="'+name+'" rows="10" cols="80"></textarea></div>');
    CKEDITOR.replace(name);
    PAPER.ck = window.CKEDITOR.instances[name];
  });
});
