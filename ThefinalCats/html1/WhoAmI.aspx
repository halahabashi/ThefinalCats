<%@ Page Title="Who Am I?" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WhoAmI.aspx.cs" Inherits="ThefinalCats.html1.WhoAmI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .app-main h1 { color: var(--brand-dark); }
        .quiz-card { max-width: 640px; text-align: center; }
        .quiz-card p { margin: 6px auto 0; }
        .quiz-banner, .quiz-photo {
            width: 100%; max-width: 460px; height: auto; display: block;
            margin: 6px auto 18px; border-radius: 16px; box-shadow: var(--shadow-lg);
        }
        .quiz-progress { color: var(--muted); font-weight: 600; margin-bottom: 12px; }
        .quiz-options { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; margin-top: 6px; }
        .quiz-opt {
            appearance: none; cursor: pointer; font: inherit; font-weight: 600;
            padding: 13px 14px; border-radius: 12px; border: 1px solid var(--line);
            background: #fff; color: var(--ink); transition: background .12s, border-color .12s, transform .08s;
        }
        .quiz-opt:hover:not(:disabled) { border-color: var(--brand); background: var(--brand-soft); transform: translateY(-1px); }
        .quiz-opt:disabled { cursor: default; }
        .quiz-opt.correct { background: #dcfce7; border-color: var(--ok); color: #14532d; }
        .quiz-opt.wrong   { background: #fee2e2; border-color: var(--danger); color: #7f1d1d; }
        .quiz-final { font-size: 2.6rem; font-weight: 800; color: var(--brand-dark); margin: 10px 0 4px; }
        .quiz-card .btn { margin-top: 18px; }
        @media (max-width: 480px) { .quiz-options { grid-template-columns: 1fr; } }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Who Am I?</h1>

    <% if (!LoggedIn) { %>
        <div class="card quiz-card">
            <h2>Members only 🐾</h2>
            <p>The <strong>Who Am I?</strong> cat quiz is just for registered members. Please log in to play.</p>
            <a class="btn" href="<%= ResolveUrl("~/html1/Login.aspx") %>">Log in</a>
        </div>
    <% } else { %>

        <!-- Intro -->
        <div id="intro" class="card quiz-card">
            <img class="quiz-banner" src="<%= ResolveUrl("~/html1/Pics/game-whoami.jpg") %>" alt="Who am I?" />
            <h2>Guess the cat!</h2>
            <p>I'll show you a cat and you guess my breed from 4 choices. There are <strong>9</strong> cats — how many can you name?</p>
            <button class="btn" type="button" onclick="WhoAmI.start()">Start game</button>
        </div>

        <!-- Question -->
        <div id="question" class="card quiz-card" style="display:none;">
            <div class="quiz-progress">
                Question <span id="qNum"></span> / <span id="qTotal"></span> &nbsp;·&nbsp; Score: <span id="score">0</span>
            </div>
            <img id="qImg" class="quiz-photo" alt="Which breed am I?" />
            <h2>Who am I?</h2>
            <div id="options" class="quiz-options"></div>
            <button id="nextBtn" class="btn" type="button" style="display:none;" onclick="WhoAmI.next()">Next</button>
        </div>

        <!-- Result -->
        <div id="result" class="card quiz-card" style="display:none;">
            <h2>Your score</h2>
            <div id="finalScore" class="quiz-final"></div>
            <p id="finalMsg"></p>
            <button class="btn" type="button" onclick="WhoAmI.start()">Play again</button>
        </div>

        <script>
            var WhoAmI = (function () {
                var picBase = "<%= ResolveUrl("~/html1/Pics/breeds/") %>";
                var breeds = [
                    { name: "Birman", img: "birman.jpg" },
                    { name: "British Longhair", img: "british-longhair.jpg" },
                    { name: "Kinkalow", img: "kinkalow.jpg" },
                    { name: "LaPerm", img: "laperm.jpg" },
                    { name: "Oriental Longhair", img: "oriental-longhair.jpg" },
                    { name: "Russian Blue", img: "russian-blue.jpg" },
                    { name: "Snowshoe", img: "snowshoe.jpg" },
                    { name: "Somali", img: "somali.jpg" },
                    { name: "Turkish Angora", img: "turkish-angora.jpg" }
                ];

                var order = [], idx = 0, score = 0, answered = false;

                function shuffle(a) {
                    for (var i = a.length - 1; i > 0; i--) {
                        var j = Math.floor(Math.random() * (i + 1));
                        var t = a[i]; a[i] = a[j]; a[j] = t;
                    }
                    return a;
                }

                function show(id) {
                    ["intro", "question", "result"].forEach(function (s) {
                        document.getElementById(s).style.display = (s === id) ? "block" : "none";
                    });
                }

                function start() {
                    order = shuffle(breeds.slice());
                    idx = 0; score = 0;
                    document.getElementById("score").textContent = "0";
                    show("question");
                    render();
                }

                function render() {
                    answered = false;
                    var b = order[idx];
                    document.getElementById("qNum").textContent = idx + 1;
                    document.getElementById("qTotal").textContent = order.length;
                    document.getElementById("qImg").src = picBase + b.img;

                    var others = shuffle(breeds.filter(function (x) { return x.name !== b.name; }));
                    var opts = shuffle([b.name, others[0].name, others[1].name, others[2].name]);

                    var box = document.getElementById("options");
                    box.innerHTML = "";
                    opts.forEach(function (name) {
                        var btn = document.createElement("button");
                        btn.type = "button";
                        btn.className = "quiz-opt";
                        btn.textContent = name;
                        btn.onclick = function () { choose(btn, name, b.name); };
                        box.appendChild(btn);
                    });
                    document.getElementById("nextBtn").style.display = "none";
                }

                function choose(btn, picked, correct) {
                    if (answered) return;
                    answered = true;
                    var btns = document.querySelectorAll("#options .quiz-opt");
                    for (var i = 0; i < btns.length; i++) {
                        btns[i].disabled = true;
                        if (btns[i].textContent === correct) btns[i].classList.add("correct");
                        else if (btns[i] === btn) btns[i].classList.add("wrong");
                    }
                    if (picked === correct) {
                        score++;
                        document.getElementById("score").textContent = score;
                    }
                    var nb = document.getElementById("nextBtn");
                    nb.textContent = (idx === order.length - 1) ? "See result" : "Next";
                    nb.style.display = "inline-block";
                }

                function next() {
                    idx++;
                    if (idx >= order.length) { result(); return; }
                    render();
                }

                function result() {
                    show("result");
                    var total = order.length;
                    document.getElementById("finalScore").textContent = score + " / " + total;
                    var pct = score / total, msg;
                    if (pct === 1) msg = "Purrfect! You're a true cat whisperer 🐱👑";
                    else if (pct >= 0.7) msg = "Great job — you really know your cats!";
                    else if (pct >= 0.4) msg = "Not bad! A little more cuddling and you'll be an expert.";
                    else msg = "The cats are confused 😹 — give it another try!";
                    document.getElementById("finalMsg").textContent = msg;
                }

                return { start: start, next: next };
            })();
        </script>

    <% } %>
</asp:Content>
