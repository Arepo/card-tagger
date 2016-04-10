Pakyow::App.routes do
  default do
    reroute '/cards'
  end

  get '/cards' do
    tags = Tag.ids_and_full_names.map do |id, full_name|
      { tag: { value: id, content: full_name } }
    end
    view.scope(:'tag-names').apply(tags)

    name = params["card-name"] || ""

    view.scope(:card).apply(Card.by_name(name)) do |context, card|
      context.scope(:tag).apply(card.tags)
    end
  end
end
