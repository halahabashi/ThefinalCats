<%@ Page Title="Cat Breeds" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Breeds.aspx.cs" Inherits="ThefinalCats.html1.Breeds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .app-main h1 { color: var(--brand-dark); }
        .breeds-intro { text-align: center; color: var(--muted); margin: 0 auto 22px; }
        .table-wrap { overflow-x: auto; }
        .breeds-table { width: 100%; min-width: 720px; }
        .breeds-table th, .breeds-table td { text-align: start; vertical-align: top; }
        .breeds-table td:first-child { font-weight: 700; white-space: nowrap; }
        .breeds-table td:first-child a { color: var(--brand-dark); }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Cat Breeds</h1>
    <p class="breeds-intro">A quick guide to all the cats on our site — click a name to read more.</p>

    <div class="table-wrap">
        <table class="breeds-table">
            <tr>
                <th>Breed Name</th>
                <th>Place of Origin</th>
                <th>General Color</th>
                <th>Fun Fact</th>
            </tr>
            <tr>
                <td><a href="<%= ResolveUrl("~/html1/Birman.aspx") %>">Birman</a></td>
                <td>Burma (Myanmar) / developed as a breed in France</td>
                <td>Light body with darker "points" (seal, blue, etc.), blue eyes, and signature white "gloves" on the paws</td>
                <td>Birman kittens are born completely white, and their colored points only start to appear a few weeks after birth.</td>
            </tr>
            <tr>
                <td><a href="<%= ResolveUrl("~/html1/British%20Longhair.aspx") %>">British Longhair</a></td>
                <td>United Kingdom</td>
                <td>Comes in over 300 color varieties, but blue (gray) is the most popular</td>
                <td>The British Longhair is basically a British Shorthair with a fluffy coat — it came from crossing British Shorthairs with Persian cats.</td>
            </tr>
            <tr>
                <td><a href="<%= ResolveUrl("~/html1/Kinkalow.aspx") %>">Kinkalow</a></td>
                <td>United States</td>
                <td>Almost any color or pattern; coat can be short or long</td>
                <td>A rare dwarf breed made by crossing the short-legged Munchkin with the curl-eared American Curl — so it has both short legs and backward-curling ears.</td>
            </tr>
            <tr>
                <td><a href="<%= ResolveUrl("~/html1/LaPerm.aspx") %>">LaPerm</a></td>
                <td>United States (Oregon)</td>
                <td>Many colors and patterns; coat ranges from soft waves to tight curls</td>
                <td>The whole breed traces back to a single bald kitten named "Curly," born in 1982, that later grew a soft curly coat.</td>
            </tr>
            <tr>
                <td><a href="<%= ResolveUrl("~/html1/Oriental%20Longhair.aspx") %>">Oriental Longhair</a></td>
                <td>United Kingdom (developed from the Siamese)</td>
                <td>Over 300 colors and patterns; usually vivid green, almond-shaped eyes</td>
                <td>Nicknamed the "Rainbow cat" because it comes in more colors and patterns than almost any other breed.</td>
            </tr>
            <tr>
                <td><a href="<%= ResolveUrl("~/html1/Russian%20Blue.aspx") %>">Russian Blue</a></td>
                <td>Russia (port city of Arkhangelsk)</td>
                <td>Shimmering silver-tipped blue-gray coat with bright green eyes</td>
                <td>Its slightly upturned mouth gives it a permanent gentle "smile" — and it was once a favorite of the Russian czars.</td>
            </tr>
            <tr>
                <td><a href="<%= ResolveUrl("~/html1/Snowshoe.aspx") %>">Snowshoe</a></td>
                <td>United States</td>
                <td>Seal or blue points with a white "V" on the face and white "snowshoe" feet; blue eyes</td>
                <td>It's rare because the exact white-feet markings are very hard to breed for — it started by accident from Siamese kittens with white paws.</td>
            </tr>
            <tr>
                <td><a href="<%= ResolveUrl("~/html1/Somali.aspx") %>">Somali</a></td>
                <td>United States (long-haired Abyssinian)</td>
                <td>Warm "ticked" coat in ruddy, red, blue or fawn, with a bushy tail</td>
                <td>Often called the "fox cat" thanks to its bushy tail and ticked coat; it's the long-haired version of the Abyssinian.</td>
            </tr>
            <tr>
                <td><a href="<%= ResolveUrl("~/html1/Turkish%20Angora.aspx") %>">Turkish Angora</a></td>
                <td>Turkey (Ankara region)</td>
                <td>Long silky coat, classically pure white; many colors; eyes can be blue, green, amber or odd-eyed</td>
                <td>One of the oldest natural breeds; in Turkey, pure-white odd-eyed Angoras are treasured as a national symbol.</td>
            </tr>
        </table>
    </div>
</asp:Content>
