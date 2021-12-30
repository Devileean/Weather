//
//  WeekDayPiker.swift
//  Weather
//
//  Created by Алексей Логинов on 30.12.2021.
//

import UIKit

enum Day: Int {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    static let allDays: [Day] = [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
    
    var title: String {
        switch self {
        case .monday: return "ПН"
        case .tuesday: return "ВТ"
        case .wednesday: return "СР"
        case .thursday: return "ЧТ"
        case .friday: return "ПТ"
        case .saturday: return "СБ"
        case .sunday: return "ВС"
        }
    }
}




@IBDesignable class WeekDayPiker: UIControl {
//MARK: Осталось вызвать метод sendActions, который сообщит об изменении значения контрола. Это нужно сделать после изменения свойства, то есть в методе didSet:

    var selectedDay: Day? = nil {
        didSet {
            self.updateSelectedDay()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
  
    
    //MARK: Метод setupView нужно вызвать в инициализаторах класса:
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        for day in Day.allDays {
            let button = UIButton(type: .system)
            button.setTitle(day.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectDay(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        
        self.addSubview(stackView)
        
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    //MARK: Метод updateSelectedDay вызывается каждый раз при изменении свойства selectedDay. Это можно сделать, добавив метод didSet:
    private func updateSelectedDay() {
        for (index, button) in self.buttons.enumerated() {
            guard let day = Day(rawValue: index) else { continue }
            button.isSelected = day == self.selectedDay
        }
    }
    //MARK: Чтобы обработать нажатия на кнопки, создадим метод selectDay, который указывали, когда добавляли таргет к кнопке:
    @objc private func selectDay(_ sender: UIButton) {
        guard let index = self.buttons.index(of: sender) else { return }
        guard let day = Day(rawValue: index) else { return }
        self.selectedDay = day
        
        //В этом методе сначала получаем индекс кнопки (который является номером дня), затем пытаемся получить день, передав в инициализатор его номер. После присваиваем новый день свойству selectedDay.
    }
    //MARK: Заметьте, что мы не установили констрейнты для UIStackView. Вместо них будем менять frame в методе layoutSubviews:
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
}

