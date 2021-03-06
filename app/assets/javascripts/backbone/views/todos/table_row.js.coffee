class sub.Views.TodosTableRow extends sub.Views.Base
  template: JST['todos/row']
  tagName: 'tr'
  events:
    'click .edit' : 'editTodo'
    'click .delete' : 'removeTodo'
    'click .update_status' : 'updateTodoStatus'
    'click .show' : 'showTodo'
    

  initialize: ->
    # the newer syntax which replaces the legacy:
    #   @model.on('destroy', @remove, @)
    # ideally this.remove should only be called once the destroy action successfully completes
    @listenTo(@model, 'remove', -> @model.destroy())
    @listenTo(@model, 'destroy', @remove)


  render: ->
    @$el.html(@template(@model.toJSON()))
    @


  editTodo: (event) ->
    @leave
    sub.mainRouter.navigate('/edit/' + this.model.get('id') , {trigger: true})

  showTodo: (event) ->
    @leave
    sub.mainRouter.navigate('/show/' + this.model.get('id') , {trigger: true})

  removeTodo: (event) ->
    @leave
    @model.collection.remove(@model)

  updateTodoStatus: (event) ->
    alert('this is not yet implemented')
