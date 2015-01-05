module GeneralHelpers
  def expect_to_be_destroyed(model)
    expect(model.class.find_by_id(model.id)).to be_nil
  end
end