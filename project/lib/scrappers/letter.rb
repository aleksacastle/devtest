module Letter
  def count_letter(page, letter)
    doc = page.css('*').text
    doc.count(letter)/100
  end
end
