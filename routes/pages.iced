exports.index = (req, res) ->
  res.render 'index',
  	title: 'Hello!'
  	message: 'Wellcome to my first application deployed on AppFog!'
