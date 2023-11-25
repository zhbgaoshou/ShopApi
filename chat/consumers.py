from channels.generic.websocket import AsyncWebsocketConsumer
from channels.exceptions import StopConsumer
import json


class ChatConsumer(AsyncWebsocketConsumer):
    async def websocket_connect(self, message):
        # 有客户端向后端改善websocket请求时自动触发
        # 服务端允许执行下行代码，如果不允许可以用 raise StopConsumner()拒绝客户端的连接请求
        # 加组
        await self.channel_layer.group_add('111', self.channel_name)
        await self.accept()

    async def websocket_disconnect(self, message):
        # 断开连接时触发
        await self.channel_layer.group_discard('111', self.channel_name)
        raise StopConsumer()

    async def websocket_receive(self, message):
        # 客户端发来数据时触发，message是客户端发来的数据（一个字典）
        await self.channel_layer.group_send(
            '111',
            {
                'type': 'chat_message',
                'message': message
            }
        )

    async def chat_message(self, evt):
        ret = {}
        # message = json.loads(evt['message']['text'])
        # if message.sender == 'user':
        #     ret['align'] = 'right'
        # else:
        #     ret['align'] = 'left'
        print(type(json.loads(evt['message']['text'])))
        await self.send('1123')
