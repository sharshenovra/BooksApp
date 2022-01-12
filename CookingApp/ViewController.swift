import UIKit
import SnapKit
import Kingfisher
import youtube_ios_player_helper

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionView: UICollectionView?
    
    var books: [Books] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  books.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCVC.identifier, for: indexPath) as! CustomCVC
            cell.layer.cornerRadius = 30
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 5, height: 5)
            cell.layer.shadowOpacity = 1.0
            cell.layer.shadowRadius = 10
            cell.layer.masksToBounds = true
            let url = URL(string: books[indexPath.row].bookImage ?? "")
            
            cell.configure(label: books[indexPath.row].name!, image: url!, price: "Цена: \(books[indexPath.row].price!) сом")
            
            return cell
        }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rootVC = DetailedViewController()
        navigationController?.pushViewController(rootVC, animated: true)
        rootVC.title = books[indexPath.row].name
        rootVC.nameLabel.text = books[indexPath.row].name
        
        rootVC.priceLabel.text = "Цена: \(books[indexPath.row].price!) сом"
        
        rootVC.titleLabel.text = books[indexPath.row].title
        
        rootVC.bookImage.kf.setImage(with: URL(string: books[indexPath.row].bookImage ?? ""))

        rootVC.youtubeView.load(withVideoId: books[indexPath.row].videoUrl!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBooks()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CustomCVC.self, forCellWithReuseIdentifier: CustomCVC.identifier)
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .gray
        collectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    }
    
    func setupBooks(){
        books.append(Books(name: "Мюллер,Сфер,Семпф:\nC# для чайников", bookImage: "https://img3.labirint.ru/rc/a8fe20b9f75db2fc808c1205adb76eee/594x918/books71/706031/cover.jpg?1562153179", price: 1210, title: "Даже если вы никогда не имели дела с программированием, эта книга поможет вам освоить язык C# и научиться писать на нем программы любой сложности. Для читателей, которые уже знакомы с каким-либо языком программирования, процесс изучения C# только упростится, но иметь опыт программирования для чтения книги совершенно необязательно.Из этой книги вы узнаете не только о типах, конструкциях и операторах языка C#, но и о ключевых концепциях объектно-ориентированного программирования, реализованных в этом языке, который в настоящее время представляет собой один из наиболее приспособленных для создания программ для Windows инструментов. Если вы в начале большого пути в программирование, смелее покупайте эту книгу: она послужит вам отличным путеводителем, который облегчит ваши первые шаги на этом длинном, но очень увлекательном пути.Узнайте, как создать консольное приложение и что такое делегаты, события и интерфейсы!C# - мощный язык программирования, который стал любимым инструментом программистов, работающих с Visual Studio, и эта книга поможет вам быстро и безболезненно освоить новейшую его версию. Вы научитесь создавать приложения для Windows, использовать графику, потоки, контейнеры, базы данных и многое другое, узнаете, что такое .NET Framework, полиморфизм, наследование и обобщенное программирование, а также изучите множество других важных и интересных вещей.В книге\nСоздание приложений для Windows\nЦиклы и условные переходы\nСинтаксис коллекций\nИнтерфейсы и объектно-ориентированные концепции\nДелегаты и события\nБезопасный код\nРабота с разнообразными источниками данных\nСоздание приложений для работы в Интернете\nОб авторе\nДжон Пол Мюллер - независимый автор и технический редактор. На сегодняшний день он написал 104 книги и более 600 статей на самые разные темы: от сетей до искусственного интеллекта и от управления базами данных до головокружительного программирования. Некоторые из его текущих работ включают книгу о машинном обучении, пару книг по Python и книгу о MATLAB. Благодаря навыкам технического редактора Джон помог более чем 70 авторам усовершенствовать свои рукописи. Джон всегда интересовался разработкой программного обеспечения и писал о самых разных языках программирования.", videoUrl: "_8yZYhAkQjQ"))
        books.append(Books(name: "Ден Томашевский:\nСмартфоны с Android", bookImage: "https://img3.labirint.ru/rc/0c59d4e594b1c2803bf6de6fadae7b7d/220x340/books53/525055/cover.jpg?1563892628", price: 969, title: "Эта книга написана просто и доступно, в ней нет скучных разъяснений и технических деталей. Автор ведет читателя к цели самым коротким и простым путем, не только упрощая текст, но и тщательно подбирая иллюстрации.\nАвтор рассказывает читателю коротко и понятно:\nосновные приемы работы со смартфонами, оснащенными ОС Android,настройка устройства, подключение к сети, просмотр веб-сайтов, электронная почта,фотосъемка и видеозапись, музыка, книги, фильмы,общение в социальных сетях,ориентирование и прокладывание маршрута на местности,загрузка и установка приложений из виртуальных магазинов.\nНу а если возникнут какие-либо проблемы, здесь вы найдете необходимые рекомендации, чтобы легко справиться с ними самостоятельно", videoUrl: "JosO0LQ3F7E"))
        books.append(Books(name: "Аллен Тейлор:\nSQL для чайников", bookImage: "https://img3.labirint.ru/rc/5b6fea5358df5aa6296dfa234a076613/220x340/books73/725637/cover.jpg?1573813554", price: 2075, title: "Перед вами новейшее издание бестселлера, посвященное последней версии стандарта SQL. Здесь вы найдете информацию о том, как эффективно применять SQL для построения реляционных баз данных. Вы узнаете, как проектировать и защищать базы данных, а также извлекать из них всю необходимую информацию. В эпоху больших данных крайне важно иметь под рукой простое и доступное руководство по работе с информационными ресурсами.\nВ книге:\nВозможности SQL\nИспользование SQL для создания баз данных\nПостроение многотабличных реляционных баз данных\nМанипулирование информацией в базах данных\nСоздание сложных запросов\nИспользование реляционных операторов\nОбеспечение безопасности базы данных\nАллен Тейлор - ветеран компьютерной индустрии с тридцатилетним стажем, автор более 40 книг. Читает лекции по базам данных и компьютерным технологиям, а также ведет онлайн-курсы по разработке баз данных.", videoUrl: "lapMmGGFS7k"))
        books.append(Books(name: "Титтел, Минник:\nHTML5 и CSS3", bookImage: "https://img3.labirint.ru/rc/39a21c76fc30f7db304d346bb698fc32/220x340/books69/685649/cover.jpg?1581251109", price: 1210, title: "Полагаете, что создавать веб-сайты очень сложно? Ошибаетесь! С появлением HTML5, новейшей версии стандарта HTML, создавать и настраивать веб-страницы стало проще, чем когда-либо. С помощью этой замечательной книги, написанной простым и понятным языком, вы освоите искусство веб-дизайна, изучите основы HTML5 и CSS3 и научитесь создавать собственные сайты.\nОсвойте язык разметки. Изучите синтаксис языков HTML5 и CSS3, познакомьтесь со структурой типовых веб-страниц и создайте свой первый веб-сайт с нуля.\nНачните создавать веб-страницы. Познакомьтесь с HTML-тегами, применяемыми для создания заголовков и тела веб-страниц, и научитесь форматировать абзацы и другие текстовые контейнеры, а также добавлять на веб-страницы ссылки и таблицы.\nСделайте свой сайт привлекательным. Чтобы привлечь как можно больше посетителей на сайт, добавьте на него гиперссылки, изображения, звук, видеоклипы и потоковое медиа.\nИспользуйте стили CSS. Применяйте таблицы стилей CSS для макетирования веб-страниц и улучшения внешнего вида сайта.\nБудьте мобильными. Разрабатывайте сайты, предназначенные для просмотра на экранах мобильных устройств.\nОсновные темы книги:\nсоздание веб-страниц\nформатирование веб-страниц с помощью (X)HTML\nпросмотр и публикация веб-страниц в Интернете\nприменение метаданных поисковыми системами\nуправление текстовыми блоками, списками и таблицами\nсоздание ссылок на документы и другие веб-сайты\nнастройка стилевых правил CSS\nчто можно, а чего нельзя делать с помощью HTML\nЭд Титтел работает в компьютерной индустрии почти 30 лет. Автор более 140 книг.\nКрис Минник руководит компанией Minnick Web Services. Преподает, читает лекции, дает консультации в области веб-программирования и пишет книги. Автор книги JavaScript для чайников.", videoUrl: "Jf9FYXuM_Ts"))
        books.append(Books(name: "Барбара Рокфеллер:\nТехнический анализ", bookImage: "https://img4.labirint.ru/rc/1dcdd93b1fd664ea3e15a24c12bd9992/220x340/books71/703164/cover.jpg?1560777955", price: 1814, title: "Технический анализ - это набор методик, оптимизирующих принятие решений по покупке и продаже на рынках ценных бумаг. Если вы решили стать техническим трейдером, т.е. торговать на бирже с помощью методов технического анализа, эта книга - для вас!\nВы получите бесценные советы от профессионального трейдера Барбары Рокфеллер, которая не только много лет зарабатывает деньги на бирже, но и консультирует успешных трейдеров. Вы познакомитесь с методами технического анализа, научитесь читать графики и пользоваться индикаторами, освоите работу с фигурами и стоп-приказами.\nЭта книга поможет вам понять, почему ценные бумаги ведут себя не так, как предсказывают экономисты и финансовые аналитики, и научить вас использовать эту информацию для выбора и успешной торговли ценными бумагами.\nВ книге:\nИнструменты технического трейдинга\nВыбор индикаторов, подходящих лично вам и вашему отношению к риску\nТренды, ценовые столбики, фигуры, развороты\nРазмещение стоп-приказов\nВыбор точки входа и выхода для избежания потерь\nЧтение графиков и разбор реальных ситуаций\nОб авторе\nБарбара Рокфеллер - эксперт в области технического анализа и автор книг о международном инвестировании, круглосуточном и глобальном тренинге и о торговле иностранной валютой, составитель ежедневной информационной рассылки для международного валютного рынка, основанной на методах фундаментального и технического анализа. Барбара консультирует индивидуальных клиентов и учреждения, составляя для них персонализированные графики.", videoUrl: "K20dRWYzef4"))
        books.append(Books(name: "Джон Мюллер:\nPython для чайников", bookImage: "https://img3.labirint.ru/rc/503c7851b9b08cf16f0024ebfd7e0c98/220x340/books71/703167/cover.jpg?1560777957", price: 1453, title: "Python - это мощный язык программирования, на котором можно создавать самые разные приложения, не зависящие от платформы. Он идеально подходит для новичков, особенно если нужно быстро научиться программировать и начать создавать реальные проекты. Благодаря пошаговым инструкциям, приведенным в книге, вы сможете в краткие сроки освоить основы языка. Работая в среде Jupyter Notebook, вы будете применять принципы грамотного программирования для создания смешанного представления кода, заметок, математических уравнений и графиков.\nВ книге:\nЗагрузка и установка Python\nИспользование командной строки\nЗнакомство со средой Jupyter Notebook\nОсновы программирования на Python\nСоздание коллекций и списков\nВзаимодействие с пакетами\nПоиск и устранение ошибок\nДжон Пол Мюллер - писатель и технический редактор, автор более 100 книг и 600 статей, тематика которых варьируется от сетевых технологий и искусственного интеллекта до управления базами данных и программирования на Python. Как технический редактор помог издать книги более чем 70 авторам. Также занимается консультациями и написанием сертификационных экзаменов.", videoUrl: "KZRUAXySaEk"))
        books.append(Books(name: "Минник, Холланд:\nJavaScript для чайников", bookImage: "https://img3.labirint.ru/rc/b36ec20a5d0c700919d04c9fc15aba3b/220x340/books71/700943/cover.jpg?1559208303", price: 1210, title: "JavaScript - ключевой инструмент создания современных сайтов, и благодаря данному руководству, ориентированному на новичков, вы сможете изучить язык в короткие сроки и с минимумом усилий. Узнайте, какова структура языка, как правильно записывать его инструкции, как применять CSS, работать с онлайн-графикой и подключать программные интерфейсы HTML5. Все темы можно закрепить практическими упражнениями, доступными для выполнения на сайте Codecademy.com.\nЗаложите основы. Узнайте, что собой представляет язык JavaScript, как он работает и где используется.\nНачните с самого простого. Освойте основные элементы JavaScript на примере простейших упражнений.\nСведите все воедино. Научитесь применять переменные, массивы, операторы, условные конструкции и циклы.\nОрганизуйте свои программы. Узнайте, как создавать и применять функции и объекты.\nНачните создавать онлайн-приложения. Научитесь создавать сценарии, выполняемые в браузере, а также манипулировать документами, обрабатывать события и подключать средства ввода-вывода.\nИзучите сложные темы. Освойте регулярные выражения, функции обратного вызова, анонимные функции и замыкания.\nЗадействуйте дополнительные инструменты. Расширьте возможности своих программ за счет библиотеки jQuery и программных интерфейсов HTML5.\nПроверьте свои навыки. Посетите сайт Codecademy.com и попробуйте выполнить упражнения на JavaScript.\nОсновные темы книги:\nкак настроить среду разработки\nдля чего нужны массивы\nприменение циклов\nиспользование библиотеки jQuery\nсоздание анимации в JavaScript\nработа с CSS и графикой\nAJAX и JSON\nкак избежать распространенных ошибок\nКрис Минник - писатель, преподаватель и веб-разработчик. Имеет большой опыт реализации проектов для веб-сайтов и мобильных платформ. Ева Холланд - опытный писатель и преподаватель. Разрабатывала учебные программы по веб-дизайну, мобильной разработке и поисковой оптимизации (SEO). Крис и Ева - соучредители компании WatzThis?", videoUrl: "HuPK6AwgzJc"))
        books.append(Books(name: "Мюллер, Массарон:\nИскусственный интеллект", bookImage: "https://img3.labirint.ru/rc/bbc11e586232afee5e8755169f993aa8/220x340/books69/689151/cover.jpg?1564199849", price: 1210, title: "Искусственный интеллект является захватывающим и немного жутковатым. Он вокруг нас. Искусственный интеллект помогает защитить от мошенничества, контролировать расписание медицинских процедур, он способен работать в клиентской службе и даже помогает вам в выборе телешоу и приборке вашего дома. Хотите узнать больше? Эта книга восполняет пробелы, знакомя вас с тем, что представляет собой искусственный интеллект и чем он не является, рассматриваются также этические вопросы использования искусственного интеллекта, его современное применение и некоторые из удивительных вещей, на которые он, вероятно, будет способен завтра. Будь вы технофилом или просто любопытны, вы будете очарованы тем, что узнаете!\nВ книге:\nИстория искусственного интеллекта\nРоль данных\nКак искусственный интеллект используется в компьютерных приложениях, медицине, космосе и машинном обучении\nМифы, окружающие искусственный интеллект\nРоботы и дроны\nОб авторах\nДжон Мюллер - автор более 108 книг и 600 статей на темы от искусственного интеллекта и работы с сетями до управления базами данных. Он также является техническим редактором и консультантом.\nЛука Массарон - аналитик данных и директор по маркетинговым исследованиям, специализирующийся на многомерном статистическом анализе, машинном обучении и изучении ожиданий потребителей.", videoUrl: "f5k9ribvVfU"))
        books.append(Books(name: "Дэвид Кроудер:\nСоздание веб-сайта", bookImage: "https://img4.labirint.ru/rc/f739d3f5401a892c8b6bafa7103692d8/220x340/books69/685652/cover.jpg?1564175486", price: 1526, title: "Если вы никогда не занимались веб-дизайном, но хотели бы открыть свой сайт в Интернете, эта книга поможет вам научиться создавать вполне профессиональные сайты. Здесь вы найдете практические советы, проверенные фрагменты HTML-кода и множество ссылок на полезные ресурсы в Интернете. Вы научитесь добавлять на веб-страницы изображения, видео- и аудиоклипы, красивые кнопки и множество других элементов.\nНачните с основ. Научитесь применять базовые элементы HTML и редакторы различных типов.\nСтруктурируйте подачу материала. Обеспечьте удобство чтения текстов с помощью таблиц и фреймов, применяя современные технологии, например каскадные таблицы стилей (CSS).\nЧто в имени твоем? Выберите и зарегистрируйте доменное имя и найдите для своего сайта хорошего хостинг-провайдера.\nЛучше один раз увидеть. Узнайте, где можно найти бесплатные изображения, как отредактировать их и добавить на страницы сайта.\nСделайте сайт красивым. Узнайте, как разместить на сайте красивые кнопки, добавить на его страницы видео- и аудиоклипы.\nНе забывайте о бизнесе. Узнайте, как создать интернет-магазин, включить сайт в индексные базы поисковых систем и обменяться ссылками с другими сайтами.\nПолучите прибыль. Откройте торговый счет, зарегистрируйтесь в платежной системе и научитесь защищаться от мошенничества с платежными картами.\nОсновные темы книги:\nпланирование сайта;\nсоздание веб-страниц с помощью программы KompoZer;\nнедорогие способы размещения сайта в Интернете;\nчто необходимо знать о размещении изображений;\nкак поместить на сайт форму и обрабатывать ее;\nсоветы по созданию коммерческих сайтов;\nресурсы, на которых можно получить дельные советы;\nсведения об электронной коммерции.\nДэвид Кроудер - профессор школы языков Университета Антиокии в Колумбии. Автор нескольких десятков книг, в том числе предыдущего издания книги Создание веб-сайтов для чайников.", videoUrl: "ltMSrSis9ww"))
        books.append(Books(name: "Абрахам Никхил:\nВеб-программирование", bookImage: "https://img4.labirint.ru/rc/d20865fa3e123056c9a5db926cdf4b21/220x340/books53/521958/cover.jpg?1569259511", price: 1602, title: "Хотите научиться программированию, но не знаете, с чего начать? Эта книга - именно то, что вам нужно! Ознакомьтесь с возможностями языков программирования HTML, CSS, JavaScript, Ruby и Python, чтобы научиться создавать с их помощью современные веб-приложения. Получив базовые навыки, закрепите их на практике, для чего выполните задания, представленные на сайте Codecademy.com.\nОпыт не требуется. Узнайте, что такое программирование, как писать веб-приложения и как стать программистом.\nОбъяснения простым языком. Получите детальные инструкции по написанию исходного кода и совершенствуйте свои навыки по мере изучения новых технологий.\nОписание современных технологий. Изучите языки программирования, применяемые для написания веб-приложений: HTML, CSS, JavaScript, Ruby и Python.\nПрактическое закрепление полученных навыков. Выполняйте задания на сайте Codecademy.com, чтобы из начинающего программиста вырасти до уровня профессионального разработчика.\nОсновные темы книги:\nкак начать программировать без должного опыта\nнаписание веб-приложений\nосновы программирования на HTML\nоформление веб-страниц с помощью CSS\nсоздание интерактивных элементов с помощью JavaScript\nприменение языка Ruby для создания серверных решений\nвозможности языка Python\nНикхил Абрахам - коммерческий директор популярного сайта по обучению программированию Codecademy.com. Занимается непосредственной подготовкой учебных курсов, представленных на сайте. В рамках проекта принимает активное участие в обучении огромного количества начинающих программистов, открывая им двери в захватывающий мир профессиональной разработки программного обеспечения.", videoUrl: "iv4CrmbnDPU"))
       }
    
    }

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((view.frame.width/2) - 10), height: view.frame.height/3)
    }
}
