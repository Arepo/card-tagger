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

    tags = params['tag-ids'] || []

    cards = Card.by_name(name).tagged_with(tags)

    view.scope(:card).apply(cards) do |context, card|
      context.scope(:tag).apply(card.tags)
    end
  end
end
