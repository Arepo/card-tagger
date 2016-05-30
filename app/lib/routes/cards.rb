Pakyow.app.routes :cards do
  get '/cards' do
    tag_contents = Tag.ids_and_full_names.map do |id, full_name|
      { tag: { value: id, content: full_name } }
    end

    view.scope(:'tag-names').apply(tag_contents)

    name = params["card-name"].to_s.strip
    tags = params['tag-ids'].to_a
    cards = Card.by_name(name).tagged_with(tags)

    view.scope(:card).apply(cards) do |context, card|
      context.scope(:tag).apply(card.tags)
    end
  end
end