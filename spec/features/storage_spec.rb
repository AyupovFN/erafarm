# describe "Storage", type: :feature do
#   it "displays storages list" do
#     visit '/storage'
#     expect(page).to have_content 'Storage'
#   end
#
#   it 'allows adding storage' do
#     visit '/storage'
#     click_link 'Add storage'
#     fill_in 'Name', with: 'Secret storage 1'
#     fill_in 'Address', with: 'Kazan, Lenins street, 15'
#     click_button 'Save'
#
#     expect(page).to have_content 'Storage was successfully created'
#     expect(page).to have_content 'Kazan, Lenins street, 15'
#     expect(page).to have_content 'Secret storage 1'
#   end
# end
