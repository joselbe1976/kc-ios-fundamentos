//
//  Repository.swift
//  Westeros
//
//  Created by Fernando Rodriguez on 7/11/17.
//  Copyright © 2017 Keepcoding. All rights reserved.
//

import UIKit

final class Repository{
    
    static let local = LocalFactory()
    static let localSesion = LocalFactorySeason()
}

protocol HouseFactory {
    
    typealias Filter = (House)->Bool
    
    var houses : [House] {get}
    func house(named: String)->House?
    func houses(filteredBy: Filter) -> [House]
}

final class LocalFactory : HouseFactory{
    
    func houses(filteredBy: (House) -> Bool) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }

    

    var houses: [House]{
        get{
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Stark_escudo.png"), description: "Direwolf")
            let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "Casa_Lannister_escudo.png"), description: "Rampant Lion")
            let targaryenSigil = Sigil(image: #imageLiteral(resourceName: "targaryenSmall.jpg"), description: "Three headed dragon")
            
            let starkUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let LanisterUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            let targarianUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
            
            
            let stark = House(name: "Stark", sigil: starkSigil, words: "Invernalia!",url: starkUrl)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me road!", url: LanisterUrl)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire & Blood",url: targarianUrl)
            
            
            //starks persons
            let robb = Person(name: "Edduard", alias: "The hand of the King", house: stark, image: UIImage(named: "edduard_stark.png")!)
            let arya = Person(name: "Arya", alias: "Braavos", house: stark, image: UIImage(named: "arya_stark.png")!)
            let jon = Person(name: "Jon Snow", alias: "Commander of the Night's Watch", house: stark, image: UIImage(named: "Jon-Snow_stark.png")!)
            
     
            
            
            //lannister person
            let tyrion = Person(name: "Tyrion", alias: "The Gnome", house: lannister, image: UIImage(named: "tyrion-lannister.png")!)
            let jaime = Person(name: "Jaime", alias: "Kings killer", house: lannister, image: UIImage(named: "Jaime_lannister.png")!)
            let cersei = Person(name: "Cersei", alias: "Kings killer", house: lannister, image: UIImage(named: "cersei_lannister.png")!)
            
            //Madre de Dragones
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen, image: UIImage(named: "daenerys-targaryen.png")!)
            
            // Añadir los personajes a las casas
            stark.add(persons: robb, jon, arya)
            lannister.add(persons: tyrion, jaime, cersei)
            targaryen.add(person: dani)
            
            return [stark, lannister, targaryen].sorted()
        }
    }
    
    func house(named: String) -> House? {
        
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
        
    }
    
}


// ----- Temporadas ----------
protocol SeasonFactory {
    
    typealias Filter = (Season)->Bool
    
    var Seasons : [Season] {get}
    func Seasons(named: String)->Season?
    func Seasons(filteredBy: Filter) -> [Season]
}


final class LocalFactorySeason : SeasonFactory{
    func Seasons(filteredBy: (Season) -> Bool) -> [Season] {
        let filtered = Repository.localSesion.Seasons(filteredBy: filteredBy)
        return filtered
    }

    
    var Seasons: [Season]{
        get{
            // Aquí es donde te creas las Temporadas y sus Episodios
     
            
            let temp1 = Season(name: "Season 1", dateSeason: Date.getDateFromString("17/04/2011"), descrip: "You Win or You Die", image: #imageLiteral(resourceName: "s1e1.jpg"))
            
            temp1.add(episodeName: "Winter Is Coming", dateEpisode: Date.getDateFromString("14/04/2011"),descrip : "Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.", image: #imageLiteral(resourceName: "s1e1.jpg"))
                temp1.add(episodeName: "The Kingsroad", dateEpisode: Date.getDateFromString("24/04/2011"),descrip : "While Bran recovers from his fall, Ned takes only his daughters to King's Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them.", image: #imageLiteral(resourceName: "s1e2.jpg"))
                temp1.add(episodeName: "Lord Snow", dateEpisode: Date.getDateFromString("01/05/2011"),descrip : "Lord Stark and his daughters arrive at King's Landing to discover the intrigues of the king's realm.", image: #imageLiteral(resourceName: "s1e3.jpg"))
                temp1.add(episodeName: "Cripples, Bastards, and Broken Things ", dateEpisode: Date.getDateFromString("08/05/2011"),descrip : "Eddard investigates Jon Arryn's murder. Jon befriends Samwell Tarly, a coward who has come to join the Night's Watch.", image: #imageLiteral(resourceName: "s1e4.jpg"))
                temp1.add(episodeName: "The Wolf and the Lion ", dateEpisode: Date.getDateFromString("15/05/2011"),descrip : "Catelyn has captured Tyrion and plans to bring him to her sister, Lysa Arryn, at the Vale, to be tried for his, supposed, crimes against Bran. Robert plans to have Daenerys killed, but Eddard refuses to be a part of it and quits.", image: #imageLiteral(resourceName: "s1e5.jpg"))
                temp1.add(episodeName: "A Golden Crown", dateEpisode: Date.getDateFromString("22/05/2011"),descrip : "While recovering from his battle with Jaime, Eddard is forced to run the kingdom while Robert goes hunting. Tyrion demands a trial by combat for his freedom. Viserys is losing his patience with Drogo.", image: #imageLiteral(resourceName: "s1e6.jpg"))
                temp1.add(episodeName: "You Win or You Die", dateEpisode: Date.getDateFromString("29/05/2011"),descrip : "Robert has been injured while hunting and is dying. Jon and the others finally take their vows to the Night's Watch. A man, sent by Robert, is captured for trying to poison Daenerys. Furious, Drogo vows to attack the Seven Kingdoms", image: #imageLiteral(resourceName: "s1e7.jpg"))
                temp1.add(episodeName: "The Pointy End", dateEpisode: Date.getDateFromString("05/06/2011"),descrip : "Eddard and his men are betrayed and captured by the Lannisters. When word reaches Robb, he plans to go to war to rescue them. The White Walkers attack the Wall. Tyrion returns to his father with some new friends", image: #imageLiteral(resourceName: "s1e8.jpg"))
                temp1.add(episodeName: "Baelor", dateEpisode: Date.getDateFromString("12/06/2011"),descrip : "Robb goes to war against the Lannisters. Jon finds himself struggling on deciding if his place is with Robb or the Night's Watch. Drogo has fallen ill from a fresh battle wound. Daenerys is desperate to save him", image: #imageLiteral(resourceName: "s1e9.jpg"))
                temp1.add(episodeName: "Fire and Blood", dateEpisode: Date.getDateFromString("19/06/2011"),descrip : "With Ned dead, Robb vows to get revenge on the Lannisters. Jon must officially decide if his place is with Robb or the Night's Watch. Daenerys says her final goodbye to Drogo.", image: #imageLiteral(resourceName: "s1e10.jpg"))

            
            let temp2 = Season(name: "Season 2", dateSeason: Date.getDateFromString("01/04/2012"),descrip: "War is comming", image: #imageLiteral(resourceName: "s2e1.jpg"))
            
                temp2.add(episodeName: "The North Remembers", dateEpisode: Date.getDateFromString("01/04/2012"),descrip : "Arya makes friends with Gendry. Tyrion tries to take control of the Small Council. Theon arrives at his home, Pyke, in order to persuade his father into helping Robb with the war. Jon tries to investigate Craster's secret.", image: #imageLiteral(resourceName: "s2e1.jpg"))
                temp2.add(episodeName: "The Night Lands", dateEpisode: Date.getDateFromString("08/04/2012"),descrip : "Tyrion tries to see who he can trust in the Small Council. Catelyn visits Renly to try and persuade him to join Robb in the war. Theon must decide if his loyalties lie with his own family or with Robb.", image: #imageLiteral(resourceName: "s2e2.jpg"))
                temp2.add(episodeName: "What Is Dead May Never Die", dateEpisode: Date.getDateFromString("15/04/2012"),descrip : "Lord Baelish arrives at Renly's camp just before he faces off against Stannis. Daenerys and her company are welcomed into the city of Qarth. Arya, Gendry, and Hot Pie find themselves imprisoned at Harrenhal", image: #imageLiteral(resourceName: "s2e3.jpg"))
                temp2.add(episodeName: "Garden of Bones", dateEpisode: Date.getDateFromString("22/04/2012"),descrip : "Tyrion investigates a secret weapon that King Joffrey plans to use against Stannis. Meanwhile, as a token for saving his life, Jaqen H'ghar offers to kill three people that Arya chooses.", image: #imageLiteral(resourceName: "s2e4.jpg"))
                temp2.add(episodeName: "The Ghost of Harrenhal", dateEpisode: Date.getDateFromString("29/04/2012"),descrip : "Theon seizes control of Winterfell. Jon captures a wildling, named Ygritte. The people of King's Landing begin to turn against King Joffrey. Daenerys looks to buy ships to sail for the Seven Kingdoms.", image: #imageLiteral(resourceName: "s2e5.jpg"))
                temp2.add(episodeName: "The Old Gods and the New", dateEpisode: Date.getDateFromString("29/04/2012"),descrip : "Bran and Rickon have escaped Winterfell. Theon tries to hunt them down. Daenerys' dragons have been stolen. Jon travels through the wilderness with Ygritte as his prisoner. Sansa has bled and is now ready to have Joffrey's children.", image: #imageLiteral(resourceName: "s2e6.jpg"))
                temp2.add(episodeName: "A Man Without Honor", dateEpisode: Date.getDateFromString("13/05/2012"),descrip : "Stannis is just days from King's Landing. Tyrion prepares for his arrival. Jon and Qhorin are taken prisoner by the wildlings. Catelyn is arrested for releasing Jaime. Arya, Gendry, and Hot Pie plan to escape from Harrenhal.", image: #imageLiteral(resourceName: "s2e7.jpg"))
            temp2.add(episodeName: "The Prince of Winterfell", dateEpisode: Date.getDateFromString("20/05/2012"),descrip : "Stannis Baratheon's fleet and army arrive at King's Landing and the battle for the city begins. Cersei plans for her and her children's future.", image: #imageLiteral(resourceName: "s2e8.jpg"))
                temp2.add(episodeName: "Blackwater", dateEpisode: Date.getDateFromString("27/05/2012"),descrip : "Stannis Baratheon's fleet and army arrive at King's Landing and the battle for the city begins. Cersei plans for her and her children's future.", image: #imageLiteral(resourceName: "s2e9.jpg"))
                temp2.add(episodeName: "Valar Morghulis", dateEpisode: Date.getDateFromString("03/06/2012"),descrip : "Joffrey puts Sansa aside for Margaery Tyrell. Robb marries Talisa Maegyr. Jon prepares to meet Mance Rayder. Arya says farewell to Jaqen H'ghar. Daenerys tries to rescue her dragons", image: #imageLiteral(resourceName: "s2e10.jpg"))
            
            let temp3 = Season(name: "Season 3", dateSeason: Date.getDateFromString("31/03/2013"),descrip: "Dark Wings, Dark Words", image: #imageLiteral(resourceName: "s3e1.jpg"))
            
                temp3.add(episodeName: "Valar Dohaeris", dateEpisode: Date.getDateFromString("31/03/2013"),descrip : "Jon is brought before Mance Rayder, the King Beyond the Wall, while the Night's Watch survivors retreat south. In King's Landing, Tyrion asks for his reward. Littlefinger offers Sansa a way out.", image: #imageLiteral(resourceName: "s3e1.jpg"))
                temp3.add(episodeName: "Dark Wings, Dark Words", dateEpisode: Date.getDateFromString("07/04/2013"),descrip : "Bran and company meet Jojen and Meera Reed. Arya, Gendry, and Hot Pie meet the Brotherhood. Jaime travels through the wilderness with Brienne. Sansa confesses her true feelings about Joffery to Margaery.", image: #imageLiteral(resourceName: "s2e2.jpg"))
                temp3.add(episodeName: "Walk of Punishment", dateEpisode: Date.getDateFromString("14/04/2013"),descrip : "Robb and Catelyn arrive at Riverrun for Lord Hoster Tully's funeral. Tywin names Tyrion the new Master of Coin. Arya says goodbye to Hot Pie. The Night's Watch returns to Craster's. Brienne and Jaime are taken prisoner.", image: #imageLiteral(resourceName: "s3e3.jpg"))
                temp3.add(episodeName: "And Now His Watch Is Ended", dateEpisode: Date.getDateFromString("21/04/2013"),descrip : "Jaime mopes over his lost hand. Cersei is growing uncomfortable with the Tyrells. The Night's Watch is growing impatient with Craster. Daenerys buys the Unsullied.", image: #imageLiteral(resourceName: "s3e4.jpg"))
                temp3.add(episodeName: "Kissed by Fire", dateEpisode: Date.getDateFromString("28/04/2013"),descrip : "Robb's army is falling apart. Jaime reveals a story, to Brienne, that he has never told anyone. Jon breaks his vows. The Hound is granted his freedom. The Lannisters hatch a new plan.", image: #imageLiteral(resourceName: "s3e5.jpg"))
                temp3.add(episodeName: "The Climb", dateEpisode: Date.getDateFromString("05/05/2013"),descrip : "Jon and the wildlings scale the Wall. The Brotherhood sells Gendry to Melisandre. Robb does what he can to win back the Freys. Tyrion tells Sansa about their engagement.", image: #imageLiteral(resourceName: "s3e6.jpg"))
                temp3.add(episodeName: "The Bear and the Maiden Fair", dateEpisode: Date.getDateFromString("12/05/2013"),descrip : "Jon and the wildlings travel south of the Wall. Talisa tells Robb that she's pregnant. Arya runs away from the Brotherhood. Daenerys arrives at Yunkai. Jaime leaves Brienne behind at Harrenhal.", image: #imageLiteral(resourceName: "s3e6.jpg"))
                temp3.add(episodeName: "Second Sons", dateEpisode: Date.getDateFromString("19/05/2013"),descrip : "Daenerys tries to persuade the Second Sons to join her against Yunkai. Stannis releases Davos from the dungeons. Sam and Gilly are attacked by a White Walker. Sansa and Tyrion wed.", image: #imageLiteral(resourceName: "s3e7.jpg"))
                temp3.add(episodeName: "The Rains of Castamere", dateEpisode: Date.getDateFromString("02/06/2013"),descrip : "Robb and Catelyn arrive at the Twins for the wedding. Jon is put to the test to see where his loyalties truly lie. Bran's group decides to split up. Daenerys plans an invasion of Yunkai.", image: #imageLiteral(resourceName: "s3e8.jpg"))
                temp3.add(episodeName: "Mhysa", dateEpisode: Date.getDateFromString("09/09/2013"),descrip : "Bran and company travel beyond the Wall. Sam returns to Castle Black. Jon says goodbye to Ygritte. Jaime returns to King's Landing. The Night's Watch asks for help from Stannis.", image: #imageLiteral(resourceName: "s3e9.jpg"))

            
            
            let temp4 = Season(name: "Season 4", dateSeason: Date.getDateFromString("06/04/2014"),descrip: "All men Must Die", image: #imageLiteral(resourceName: "s4e1.jpg"))
            
                temp4.add(episodeName: "Two Swords", dateEpisode: Date.getDateFromString("06/04/2014"),descrip : "Tyrion welcomes a guest to King's Landing. At Castle Black, Jon stands trial. Daenerys is pointed to Meereen, the mother of all slave cities. Arya runs into an old enemy.", image: #imageLiteral(resourceName: "s4e1.jpg") )
            temp4.add(episodeName: "The Lion and the Rose", dateEpisode: Date.getDateFromString("13/04/2014"),descrip : "offrey and Margaery's wedding has come. Tyrion breaks up with Shae. Ramsay tries to prove his worth to his father. Bran and company find a Weirwood tree.", image: #imageLiteral(resourceName: "s4e2.jpg"))
            temp4.add(episodeName: "Breaker of Chains", dateEpisode: Date.getDateFromString("20/04/2014"),descrip : "Tyrion is arrested for the murder of Joffery and awaits trial. Sansa escapes King's Landing. Sam sends Gilly to Mole's Town as the Night's Watch finds itself in a tight spot. Meereen challenges Daenerys.", image: #imageLiteral(resourceName: "s4e3.jpg"))
            temp4.add(episodeName: "Oathkeeper", dateEpisode: Date.getDateFromString("27/04/2014"),descrip : "Jaime entrusts a task to Brienne. Daenerys frees Meereen. Jon is given permission to lead a group of Night's Watchmen to Craster's Keep. Bran and company are taken hostage.", image: #imageLiteral(resourceName: "s4e4.jpg"))
            temp4.add(episodeName: "First of His Name", dateEpisode: Date.getDateFromString("04/05/2014"),descrip : "Tommen is crowned King of the Seven Kingdoms. Cersei builds her case against Tyrion. Sansa and Lord Baelish arrive at the Eyrie. The Night's Watch attacks Craster's Keep.", image: #imageLiteral(resourceName: "s4e5.jpg"))
            temp4.add(episodeName: "The Laws of Gods and Men", dateEpisode: Date.getDateFromString("11/05/2014"),descrip : "Tyrion's trial has come. Yara and her troops storm the Dreadfort to free Theon. Daenerys meets Hizdar zo Loraq. Stannis makes a deal with the Iron Bank of Braavos.", image: #imageLiteral(resourceName: "s4e6.jpg"))
            temp4.add(episodeName: "Mockingbird", dateEpisode: Date.getDateFromString("18/05/2014"),descrip : "Tyrion tries to find a champion. Daenerys sleeps with Daario. The Hound becomes wounded. Jon's advice is ignored at Castle Black. Brienne and Podrick receive a tip on Arya's whereabouts.", image: #imageLiteral(resourceName: "s4e7.jpg"))
            temp4.add(episodeName: "The Mountain and the Viper", dateEpisode: Date.getDateFromString("01/06/2014"),descrip : "Theon helps Ramsay seize Moat Cailin. The wildlings attack Mole's Town. Sansa comes up with a story to protect Lord Baelish. Daenerys finds out a secret about Jorah Mormont. Oberyn Martell faces Gregor Clegane, the Mountain.", image: #imageLiteral(resourceName: "s4e8.jpg"))
            temp4.add(episodeName: "The Watchers on the Wall", dateEpisode: Date.getDateFromString("08/06/2014"),descrip : "The battle between the Night's Watch and the wildlings has come.", image: #imageLiteral(resourceName: "s4e9.jpg"))
            temp4.add(episodeName: "The Children", dateEpisode: Date.getDateFromString("15/06/2014"),descrip : "Jon makes an important decision. Daenerys experiences new consequences. Brienne and Podrick have an unexpected encounter. Bran achieves a goal, while Tyrion makes an important discovery.", image: #imageLiteral(resourceName: "s4e10.jpg"))
            
            
            let temp5 = Season(name: "Season 5", dateSeason: Date.getDateFromString("12/04/2015"),descrip: "The Wars to Come", image: #imageLiteral(resourceName: "s5e8.jpg"))
            
            
                temp5.add(episodeName: "The Wars to Come", dateEpisode: Date.getDateFromString("12/04/2015"),descrip : "Cersei and Jaime adjust to a world without Tywin. Tyrion and Varys arrive at Pentos. In Meereen, a new enemy emerges. Jon is caught between two kings.", image: #imageLiteral(resourceName: "s5e1.jpg"))
                temp5.add(episodeName: "The House of Black and White", dateEpisode: Date.getDateFromString("19/04/2015"),descrip : "Arya arrives in Braavos. Jaime takes on a secret mission. Ellaria Sand seeks revenge for Oberyn's death. Stannis makes Jon a generous offer as the Night's Watch elects a new Lord Commander. Daenerys is faced with a difficult decision.", image: #imageLiteral(resourceName: "s5e2.jpg"))
                temp5.add(episodeName: "High Sparrow", dateEpisode: Date.getDateFromString("26/04/2015"),descrip : "Tommen and Margaery wed. Arya has trouble adapting to her new life. Littlefinger reveals his plans to Sansa. Jon gives his first orders as Lord Commander. Tyrion and Varys arrive in Volantis.", image: #imageLiteral(resourceName: "s5e3.jpg"))
                temp5.add(episodeName: "Sons of the Harpy", dateEpisode: Date.getDateFromString("03/05/2015"),descrip : "Jorah Mormont sets sail alongside his prisoner, Tyrion. Cersei makes a move against the Tyrells. Jaime and Bronn sneak into Dorne. Ellaria and the Sand Snakes make their plans. Melisandre tempts Jon. The Harpies attack.", image: #imageLiteral(resourceName: "s5e4.jpg"))
                temp5.add(episodeName: "Kill the Boy", dateEpisode: Date.getDateFromString("10/05/2015"),descrip : "Daenerys arrests the heads of Meereen's great families. Jon makes a difficult decision. Theon is forced to face Sansa. Stannis rides south. Tyrion and Jorah enter the ruins of Old Valyria.", image: #imageLiteral(resourceName: "s5e5.jpg"))
                temp5.add(episodeName: "Unbowed, Unbent, Unbroken", dateEpisode: Date.getDateFromString("17/05/2015"),descrip : "Arya is put to the test. Tyrion and Jorah are captured by slavers. Loras Tyrell is judged by the Sparrows. Jaime and Bronn face the Sand Snakes. Sansa marries Ramsay Bolton.", image: #imageLiteral(resourceName: "s5e6.jpg"))
                temp5.add(episodeName: "The Gift", dateEpisode: Date.getDateFromString("24/05/2015"),descrip : "TJon heads east as trouble begins to stir for Sam and Gilly at Castle Black. Sansa asks Theon for help. Tyrion and Jorah are sold as slaves. Cersei savors her triumph over the Tyrells as new plots are developed in the shadows.", image: #imageLiteral(resourceName: "s5e7.jpg"))
                temp5.add(episodeName: "Hardhome", dateEpisode: Date.getDateFromString("31/05/2015"),descrip : "Tyrion advises Daenerys. Sansa forces Theon to tell her a secret. Cersei remains stubborn. Arya meets her first target. Jon and Tormund meet with the wildling elders.", image: #imageLiteral(resourceName: "s5e8.jpg"))
                temp5.add(episodeName: "The Dance of Dragons", dateEpisode: Date.getDateFromString("07/06/2015"),descrip : "Jon and the wildlings return to Castle Black. Jaime meets with Doran Martell. Stannis makes a hard choice. Arya runs into Meryn Trant. Daenerys attends the grand reopening of the fighting pits.", image: #imageLiteral(resourceName: "s5e9.jpg"))
                temp5.add(episodeName: "Mother's Mercy", dateEpisode: Date.getDateFromString("14/06/2015"),descrip : "Stannis arrives at Winterfell. Tyrion runs Meereen as Daario and Jorah go after Daenerys. Jaime and Myrcella leave Dorne. Jon sends Sam and Gilly to Oldtown. Arya challenges the Many-Faced God. Cersei confesses her sins.", image: #imageLiteral(resourceName: "s5e10.jpg"))
            
            
            let temp6 = Season(name: "Season 6", dateSeason: Date.getDateFromString("24/04/2016"),descrip: "Winter has Come", image: #imageLiteral(resourceName: "s6e1.jpg"))

                temp6.add(episodeName: "The Red Woman", dateEpisode: Date.getDateFromString("01/05/2016"),descrip : "The fate of Jon Snow is revealed. Daenerys is brought before Khal Moro. Tyrion gets used to living in Meereen. Ramsay sends his dogs after Theon and Sansa. Ellaria and the Sand Snakes make their move. Cersei mourns for Myrcella.", image: #imageLiteral(resourceName: "s6e1.jpg"))
                temp6.add(episodeName: "Home", dateEpisode: Date.getDateFromString("08/05/2016"),descrip : "Bran trains with the Three-Eyed Raven. Tommen meets with Cersei. Tyrion makes a bold move. Theon leaves while at Pyke new issues arise. Ramsay's brother is born. Davos asks Melisandre for a miracle.", image: #imageLiteral(resourceName: "s6e2.jpg"))
                temp6.add(episodeName: "Oathbreaker", dateEpisode: Date.getDateFromString("15/05/2016"),descrip : "Daenerys arrives at Vaes Dothrak. Sam and Gilly sail for Horn Hill. Arya trains as No One. Varys finds information on the Sons of the Harpy. Ramsay receives a gift. Tommen meets with the High Sparrow. At Castle Black, a miracle occurs.", image:#imageLiteral(resourceName: "s6e3.jpg"))
                temp6.add(episodeName: "Book of the Stranger", dateEpisode: Date.getDateFromString("24/04/2016"),descrip : "Sansa arrives at Castle Black. Tyrion makes a deal with the slave masters. Jorah and Daario sneak into Vaes Dothrak. Ramsay sends a letter to Jon. Theon arrives at Pyke. Cersei and Olenna Tyrell plot against the High Sparrow.", image: #imageLiteral(resourceName: "s6e4.jpg"))
                temp6.add(episodeName: "The Door", dateEpisode: Date.getDateFromString("22/05/2016"),descrip : "Sansa and Jon make plans. Arya is given another chance to prove herself. Jorah confesses a secret to Daenerys. Tyrion meets with a red priestess. Yara finds her rule tested. Bran discovers the origin of the White Walkers.", image: #imageLiteral(resourceName: "s6e5.jpg") )
                temp6.add(episodeName: "Blood of My Blood", dateEpisode: Date.getDateFromString("29/05/2016"),descrip : "Bran and Meera find a new ally. Gilly meets Sam's family. Arya makes a difficult choice. The Lannisters and Tyrells march against the High Sparrow.", image: #imageLiteral(resourceName: "s6e6.jpg") )
                temp6.add(episodeName: "The Broken Man", dateEpisode: Date.getDateFromString("05/06/2016"),descrip : "Jon and Sansa gather troops. Jaime arrives at Riverrun. Olenna Tyrell plans to leave King's Landing. Theon and Yara plan a destination. Arya makes plans to leave.", image: #imageLiteral(resourceName: "s6e8.jpg"))
                temp6.add(episodeName: "No One", dateEpisode: Date.getDateFromString("12/06/2016"),descrip : "Brienne arrives at Riverrun. Arya seeks shelter. Jaime meets with Edmure Tully. Cersei challenges the Faith. Sandor Clegane hunts for revenge. Tyrion faces the consequences of earlier decisions.", image: #imageLiteral(resourceName: "s6e8.jpg") )
                temp6.add(episodeName: "The Winds of Winter", dateEpisode: Date.getDateFromString("26/06/2016"),descrip : "Cersei and Loras Tyrell stand trial by the gods. Daenerys prepares to set sail for Westeros. Davos confronts Melisandre. Sam and Gilly arrive in the Citadel. Bran discovers a long-kept secret. Lord Frey has an uninvited guest.", image: #imageLiteral(resourceName: "s6e9.jpg"))

            
            
            return [temp1, temp2, temp3 , temp4, temp5, temp6]
        }
    }
    
    func Seasons(named: String) -> Season? {
        
        return Seasons.filter{$0.name.uppercased() == named.uppercased()}.first

        
    }
    
}






