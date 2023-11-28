from channels.generic.websocket import AsyncWebsocketConsumer
from channels.exceptions import StopConsumer
import json


class ChatConsumer(AsyncWebsocketConsumer):

    async def websocket_connect(self, message):

        room_name = self.scope['url_route']['kwargs']['group']

        # 加组
        await self.channel_layer.group_add(room_name, self.channel_name)

        await self.accept()

        welcome_speech = {'code': 100, 'message': '欢迎您!!!'}

        await self.send(json.dumps(welcome_speech))

    async def websocket_disconnect(self, message):
        room_name = self.scope['url_route']['kwargs']['group']
        # 断开连接时触发
        await self.channel_layer.group_discard(room_name, self.channel_name)

        raise StopConsumer()

    async def websocket_receive(self, message):
        # 客户端发来数据时触发，message是客户端发来的数据（一个字典）
        room_name = self.scope['url_route']['kwargs']['group']

        await self.channel_layer.group_send(
            room_name,
            {
                'type': 'chat_message',
                'message': message
            }
        )

    async def chat_message(self, evt):
        ret = {}
        message = evt['message']['text']
        msg_json = json.loads(message)

        if msg_json.get('sender') == 'user':
            ret['align'] = 'right'
        else:
            ret['align'] = 'left'
        ret['data'] = message

        await self.send(json.dumps(ret))
