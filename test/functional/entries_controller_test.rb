require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post :create, entry: { abstract: @entry.abstract, author: @entry.author, author_sortkey: @entry.author_sortkey, bibkey: @entry.bibkey, booktitle: @entry.booktitle, chapter: @entry.chapter, crossref: @entry.crossref, edition: @entry.edition, editor: @entry.editor, fk_status: @entry.fk_status, fk_type: @entry.fk_type, fk_user: @entry.fk_user, howpublished: @entry.howpublished, institution_address: @entry.institution_address, institution_name: @entry.institution_name, institution_url: @entry.institution_url, isbn: @entry.isbn, issn: @entry.issn, journal: @entry.journal, keywords: @entry.keywords, note: @entry.note, number: @entry.number, pages: @entry.pages, pdfurl: @entry.pdfurl, psurl: @entry.psurl, publisher_address: @entry.publisher_address, publisher_name: @entry.publisher_name, publisher_url: @entry.publisher_url, school_address: @entry.school_address, school_name: @entry.school_name, school_url: @entry.school_url, series: @entry.series, timestamp: @entry.timestamp, title: @entry.title, typpe: @entry.typpe, url: @entry.url, volume: @entry.volume, year: @entry.year }
    end

    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should show entry" do
    get :show, id: @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry
    assert_response :success
  end

  test "should update entry" do
    put :update, id: @entry, entry: { abstract: @entry.abstract, author: @entry.author, author_sortkey: @entry.author_sortkey, bibkey: @entry.bibkey, booktitle: @entry.booktitle, chapter: @entry.chapter, crossref: @entry.crossref, edition: @entry.edition, editor: @entry.editor, fk_status: @entry.fk_status, fk_type: @entry.fk_type, fk_user: @entry.fk_user, howpublished: @entry.howpublished, institution_address: @entry.institution_address, institution_name: @entry.institution_name, institution_url: @entry.institution_url, isbn: @entry.isbn, issn: @entry.issn, journal: @entry.journal, keywords: @entry.keywords, note: @entry.note, number: @entry.number, pages: @entry.pages, pdfurl: @entry.pdfurl, psurl: @entry.psurl, publisher_address: @entry.publisher_address, publisher_name: @entry.publisher_name, publisher_url: @entry.publisher_url, school_address: @entry.school_address, school_name: @entry.school_name, school_url: @entry.school_url, series: @entry.series, timestamp: @entry.timestamp, title: @entry.title, typpe: @entry.typpe, url: @entry.url, volume: @entry.volume, year: @entry.year }
    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, id: @entry
    end

    assert_redirected_to entries_path
  end
end
