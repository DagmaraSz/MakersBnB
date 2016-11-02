feature 'uploading an image' do
  scenario 'saves the image to the database' do
    visit '/image/new'
    expect{click_button('Upload')}.to change(Image, :count).by(1)
  end
end
