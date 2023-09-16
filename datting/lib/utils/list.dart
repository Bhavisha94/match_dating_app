import 'package:datting/model/bording.dart';
import 'package:datting/model/chat.dart';
import 'package:datting/model/chat_list.dart';
import 'package:datting/model/interest.dart';
import 'package:datting/model/matches.dart';

List<OnBordingModel> bordingList = [
  OnBordingModel(
      title: 'Algorithm',
      description:
          'Users going through a vetting process to ensure you never match with bots.',
      imagePath: 'bording1'),
  OnBordingModel(
      title: 'Matches',
      description:
          'We match you with people that have a large array of similar interests.',
      imagePath: 'bording2'),
  OnBordingModel(
      title: 'Premium',
      description:
          'Sign up today and enjoy the first month of premium benefits on us.',
      imagePath: 'bording3')
];
List<InterestModel> interest = [
  InterestModel(name: 'Photography', image: 'photography'),
  InterestModel(name: 'Shopping', image: 'shop'),
  InterestModel(name: 'Karaoke', image: 'voice'),
  InterestModel(name: 'Yoga', image: 'yoga'),
  InterestModel(name: 'Cooking', image: 'cook'),
  InterestModel(name: 'Tennis', image: 'tennis'),
  InterestModel(name: 'Run', image: 'run'),
  InterestModel(name: 'Swimming', image: 'swim'),
  InterestModel(name: 'Art', image: 'art'),
  InterestModel(name: 'Traveling', image: 'travel'),
  InterestModel(name: 'Extreme', image: 'extreme'),
  InterestModel(name: 'Music', image: 'music'),
  InterestModel(name: 'Drink', image: 'drink'),
  InterestModel(name: 'Video games', image: 'game'),
];

List<MacthesModel> matchesList = [
  MacthesModel(name: 'Leilani, 19', image: 'matches1'),
  MacthesModel(name: 'Annabelle, 20', image: 'matches2'),
  MacthesModel(name: 'Reagan, 24', image: 'matches3'),
  MacthesModel(name: 'Hadley, 25', image: 'matches4'),
  MacthesModel(name: 'Leilani, 19', image: 'matches1'),
  MacthesModel(name: 'Annabelle, 20', image: 'matches2'),
  MacthesModel(name: 'Reagan, 24', image: 'matches3'),
  MacthesModel(name: 'Hadley, 25', image: 'matches4'),
];

List<MacthesModel> activities = [
  MacthesModel(name: 'You', image: 'p1'),
  MacthesModel(name: 'Emma', image: 'p2'),
  MacthesModel(name: 'Ava', image: 'p3'),
  MacthesModel(name: 'Sophia', image: 'p4'),
  MacthesModel(name: 'Emma', image: 'p1'),
  MacthesModel(name: 'Ava', image: 'p2'),
  MacthesModel(name: 'Sophia', image: 'p3'),
  MacthesModel(name: 'Emma', image: 'p4')
];

List<ChatListModel> chatList = [
  ChatListModel(
      image: 'p1',
      name: 'Emelie',
      sender: true,
      time: '23 min',
      pendingMsg: '1',
      msg: 'Sticker 😍'),
  ChatListModel(
      image: 'p2',
      name: 'Abigail',
      sender: true,
      time: '33 min',
      pendingMsg: '2',
      msg: 'Ok, see you then.'),
  ChatListModel(
      image: 'p3',
      name: 'Elizabeth',
      sender: true,
      time: '33 min',
      pendingMsg: '',
      msg: 'Ok, see you then.'),
  ChatListModel(
      image: 'p4',
      name: 'Penelope',
      sender: false,
      time: '50 min',
      pendingMsg: '',
      msg: 'Hey! What’s up, long time..'),
  ChatListModel(
    image: 'p1',
    name: 'Chloe',
    sender: false,
    time: '55 min',
    pendingMsg: '',
    msg: 'Hello how are you?',
  ),
  ChatListModel(
      image: 'p2',
      name: 'Grace',
      sender: true,
      time: '55 min',
      pendingMsg: '',
      msg: 'Great I will write later..'),
];

List<ChatModel> chats = [
  ChatModel(
      msg:
          'Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week 😄',
      time: '2:55 PM',
      sender: true),
  ChatModel(
      msg:
          'Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕️ ',
      time: '3:02 PM',
      sender: false),
  ChatModel(msg: 'Sure, let’s do it! 😊', time: '3:10 PM', sender: true),
  ChatModel(
      msg: 'Great I will write later the exact time and place. See you soon!',
      time: '3:12 PM',
      sender: false)
];

List<String> interestList = [
  'Travelling',
  'Books',
  'Music',
  'Dancing',
  'Modeling'
];

List<String> banner = ['page1', 'gallary1', 'gallary2', 'gallary3', 'gallary4'];
