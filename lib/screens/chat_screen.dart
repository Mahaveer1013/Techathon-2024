import 'package:flutter/material.dart';
import 'package:health_care_app/models/chat.dart';
import 'package:health_care_app/screens/chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Chat> _allChats = [
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'John Doe',
      lastMessage: 'Hey, how are you?',
      time: '10:30 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Jane Smith',
      lastMessage: 'See you later!',
      time: '9:15 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Mike Johnson',
      lastMessage: 'What\'s the update?',
      time: 'Yesterday',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'John Doe',
      lastMessage: 'Hey, how are you?',
      time: '10:30 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Jane Smith',
      lastMessage: 'See you later!',
      time: '9:15 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Mike Johnson',
      lastMessage: 'What\'s the update?',
      time: 'Yesterday',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'John Doe',
      lastMessage: 'Hey, how are you?',
      time: '10:30 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Jane Smith',
      lastMessage: 'See you later!',
      time: '9:15 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Mike Johnson',
      lastMessage: 'What\'s the update?',
      time: 'Yesterday',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'John Doe',
      lastMessage: 'Hey, how are you?',
      time: '10:30 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Jane Smith',
      lastMessage: 'See you later!',
      time: '9:15 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Mike Johnson',
      lastMessage: 'What\'s the update?',
      time: 'Yesterday',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'John Doe',
      lastMessage: 'Hey, how are you?',
      time: '10:30 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Jane Smith',
      lastMessage: 'See you later!',
      time: '9:15 AM',
    ),
    Chat(
      profilePic: 'assets/images/doctor1.png',
      userName: 'Mike Johnson',
      lastMessage: 'What\'s the update?',
      time: 'Yesterday',
    ),
  ];

  List<Chat> _filteredChats = [];

  @override
  void initState() {
    super.initState();
    _filteredChats = _allChats;
  }

  void _filterChats(String query) {
    final filtered = _allChats.where((chat) {
      final userName = chat.userName.toLowerCase();
      final lastMessage = chat.lastMessage.toLowerCase();
      final input = query.toLowerCase();

      return userName.contains(input) || lastMessage.contains(input);
    }).toList();

    setState(() {
      _filteredChats = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 14, right: 14),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search by Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged:
                  _filterChats, // Call the filter function on text change
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: _filteredChats.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredChats.length,
                    itemBuilder: (context, index) {
                      final chat = _filteredChats[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatDetailScreen(
                                profilePic: chat.profilePic ??
                                    'assets/images/doctor1.png',
                                userName: chat.userName ?? 'Unknown User',
                                messages: sampleMessages,
                              ),
                            ),
                          );
                        },
                        child: ChatTile(
                          profilePic:
                              chat.profilePic ?? 'assets/images/doctor1.png',
                          userName: chat.userName ?? 'Unknown User',
                          lastMessage: chat.lastMessage ?? 'No message',
                          time: chat.time ?? 'N/A',
                        ),
                      );
                    },
                  )
                : Text('No One Found'),
          )
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String profilePic;
  final String userName;
  final String lastMessage;
  final String time;

  const ChatTile({
    required this.profilePic,
    required this.userName,
    required this.lastMessage,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            backgroundImage: profilePic.startsWith('http')
                ? NetworkImage(profilePic) // Use NetworkImage for remote URLs
                : AssetImage(profilePic)
                    as ImageProvider, // Use AssetImage for local assets
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  lastMessage,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// Sample chat data
List<Map<String, String?>> chatData = [
  {
    'profilePic': 'assets/images/doctor1.png',
    'userName': 'John Doe',
    'lastMessage': 'Hey, how are you?',
    'time': '10:30 AM',
  },
  {
    'profilePic': 'assets/images/doctor1.png',
    'userName': 'Jane Smith',
    'lastMessage': 'See you later!',
    'time': '9:15 AM',
  },
  {
    'profilePic': 'assets/images/doctor1.png',
    'userName': 'Mike Johnson',
    'lastMessage': 'What\'s the update?',
    'time': 'Yesterday',
  },
  // Add more chat data as needed
];
