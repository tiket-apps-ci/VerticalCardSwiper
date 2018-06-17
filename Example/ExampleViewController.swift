// MIT License
//
// Copyright (c) 2017 Joni Van Roost
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import VerticalCardSwiper

class ExampleViewController: UIViewController, VerticalCardSwiperDelegate, VerticalCardSwiperDatasource {
    
    private var contactsDemoData: [Contact] = [
        Contact(name: "John Doe", age: 33),
        Contact(name: "Chuck Norris", age: 78),
        Contact(name: "Bill Gates", age: 62),
        Contact(name: "Steve Jobs", age: 56),
        Contact(name: "Barack Obama", age: 56),
        Contact(name: "Mila Kunis", age: 34),
        Contact(name: "Pamela Anderson", age: 50),
        Contact(name: "Christina Anguilera", age: 37)
    ]
    
    private var cardSwiper: VerticalCardSwiper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardSwiper = view as? VerticalCardSwiper
        self.view = cardSwiper
        cardSwiper.delegate = self
        cardSwiper.datasource = self
        
        // register cardcell for storyboard use
        cardSwiper.register(nib: UINib(nibName: "ExampleCell", bundle: nil), forCellWithReuseIdentifier: "ExampleCell")
    }
    
    func cardForItemAt(cardSwiperView: CardSwiperView, cardForItemAt index: Int) -> CardCell {
        
        let cardCell = cardSwiperView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: index) as! ExampleCardCell
        
        let contact = contactsDemoData[index]
        
        cardCell.setRandomBackgroundColor()
        
        cardCell.nameLbl.text = "Name: " + contact.name
        cardCell.ageLbl.text = "Age: \(contact.age ?? 0)"
    
        return cardCell
    }
    
    func numberOfCards(cardSwiperView: CardSwiperView) -> Int {
        return contactsDemoData.count
    }
    
    func didSwipeCardAway(card: CardCell, index: Int, swipeDirection: CellSwipeDirection) {
        
        contactsDemoData.remove(at: index)
    }
}
