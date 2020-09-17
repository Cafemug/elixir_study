// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//
import "phoenix_html"
import {Socket, Presence} from "phoenix"
 
// Socket
let user_id = document.getElementById("user_id").innerText
let socket = new Socket("/socket", {params: {user_id: user_id}})
socket.connect()

let presences = {}
 
let formatTimestamp = (timestamp) => {
  let date = new Date(timestamp)
  return date.toLocaleTimeString()
}
let listBy = (user_id, {metas: metas}) => {
  return {
    userId: user_id,
    onlineAt: formatTimestamp(metas[0].online_at)
  }
}
 
let userList = document.getElementById("user_list")
let render = (presences) => {
  userList.innerHTML = Presence.list(presences, listBy)
    .map(presence => `
      <li>
        <b>${presence.userId}</b>
        <br><small>online since ${presence.onlineAt}</small>
      </li>
    `)
    .join("")
}
 
// Channels
let channel = socket.channel("room:lobby", {})
 
channel.on("presence_state", state => {
  presences = Presence.syncState(presences, state)
  render(presences)
})
 
channel.on("presence_diff", diff => {
  presences = Presence.syncDiff(presences, diff)
  render(presences)
})
 
channel.join()

let messageInput = document.getElementById("new_message")
messageInput.addEventListener("keypress", (e) => {
  if(e.keyCode == 13 && messageInput.value != ""){
    channel.push("message:new", messageInput.value)
    messageInput.value = ""
  }
})

let messageList = document.getElementById("message_list")
let renderMessage = (message) => {
  let messageElement = document.createElement("li")
  messageElement.innerHTML = `
    <b>${message.user_id}</b>
    <i>${formatTimestamp(message.timestamp)}</i>
    <p>${message.body}</p>
  `
  messageList.appendChild(messageElement)
  messageList.scrollTop = messageList.scrollHeight;
}

channel.on("message:new", message => renderMessage(message))