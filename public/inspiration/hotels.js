    function() {
        $(document)
            .ready(function() {
                var e, t, n, i, r, o;
                return 
                $(".search-field")
                    .autocomplete({
                        appendTo: ".search-form",
                        source: "/search_suggestions",
                        close: function(e) {
                            var t;
                            return t = $(".search-field")
                                .val()
                                .toLowerCase(), "Enter" === e.key &&
                                $("a:contains('" + t + "')")
                                .trigger("click"), r.featureLayer.eachLayer(
                                    function(e) {
                                        var n;
                                        return e.feature.properties
                                            .name === t ? (n = e._leaflet_id,
                                                r._layers[n].openPopup()
                                            ) : void 0
                                    })
                        }
                    }), 
                $(".search-form")
                    .submit(function(e) {
                        var t, n;
                        return e.preventDefault(), n = $(
                                ".search-field")
                            .val()
                            .toLowerCase(), t = !1, r.featureLayer.eachLayer(
                                function(e) {
                                    var i;
                                    return e.feature.properties.name ===
                                        n ? (i = e._leaflet_id, r._layers[
                                            i].openPopup(), t = !0) :
                                        void 0
                                }), t ? void 0 : $.ajax({
                                url: "/hotels/" + n.split(" ")
                                    .join("_") + ".js"
                            })
                    }), o = L.mapbox.tileLayer("https://api.mapbox.com/v3/mapbox.dark.json", {
                        detectRetina: !0
                    }), r = L.mapbox.map("map", null, {
                        zoomControl: !1
                    })
                    .addLayer(o), r.scrollWheelZoom.disable(), t = window.getComputedStyle(
                        document.body, ":after"), e = t.getPropertyValue(
                        "content")
                    .replace(/['"]/g, ""), "mobile" === e ? r.setView([28.3849,-81.6044], 12) : "tablet" === e ? r.setView([28.3849,-81.6044], 12) : r.setView([28.3849,-81.6044],
                        13), r.tap || new L.Control.Zoom({
                        position: "bottomright"
                    })
                    .addTo(r), r.featureLayer.on("layeradd", function(e) {
                        var t, n, i, r, o;
                        return t = e.layer, i = t.feature.properties,
                            "food" === i.kind ? r =
                            '<img alt="Silverware" height="22" src="/public_assets/assets/silverware-9d0a4d173d9e135f903fccb2d009de22.svg" />' :
                            "drinks" === i.kind ? r =
                            '<img alt="Glass" height="22" src="/public_assets/assets/glass-9b07ca51d32a1325e6e433eae1e1612d.svg" />' :
                            "food+drinks" === i.kind && (r =
                                '<img alt="Silverware" height="22" src="/public_assets/assets/silverware-9d0a4d173d9e135f903fccb2d009de22.svg" /><img alt="Glass" height="22" src="/public_assets/assets/glass-9b07ca51d32a1325e6e433eae1e1612d.svg" />'
                            ), o = "" === i.website ? "" :
                            ' &#124; <a class="link" href="http://' + i
                            .website + '">website</a>', n =
                            '<div class="popup"><div class="type"><span>' +
                            i.kind + "</span>" + r +
                            '</div><div class="info"><h3 class="popup-title">' +
                            i.name + '</h3><p class="hours">' + i.hours +
                            '</p><p class="address">' + i.address +
                            '</p></div><img alt="Right arrow" class="right-arrow" src="/public_assets/assets/right-arrow-0d1ba3c494d476ab7d0906cf7e933e26.svg" /></div>',
                            t.bindPopup(n, {
                                closeButton: !1,
                                minWidth: 320
                            })
                    }),

                $.ajax({
                        dataType: "text",
                        url: "/hotels.json",
                        success: function(e) {
                            var t;
                            return t = $.parseJSON(e), r.featureLayer
                                .setGeoJSON(t)
                        }
                    }),
                r.on("popupopen",

                        function() {
                            return $(".popup")
                                .click(
                                    function() {
                                        var e;
                                        return e = $(this)
                                            .find(".popup-title")
                                            .text()
                                            .split(" ")
                                            .join("_"),
                                            $.ajax({
                                                url: "/hotels/" + e +
                                                    ".js"
                                            })
                                    })
                        }), 
                $("article li")
                    .click(
                        function() {
                            var t, n;
                            return t = $(this), n = t.find("h2")
                                .text(), r.featureLayer.eachLayer(
                                    function(t) {
                                        var i;
                                        return t.feature.properties.name ===
                                            n ? (i = t._leaflet_id,
                                                "mobile" === e ? $(
                                                    "html, body")
                                                .animate({
                                                        scrollTop: "0px"
                                                    }, 200, "swing",
                                                    function() {
                                                        return r._layers[i]
                                                            .openPopup()
                                                    }) : r._layers[i].openPopup()
                                            ) : void 0
                                    })
                        }), "mobile" === e && $("#map")
                    .click(function() {
                        return $(".sidebar")
                            .animate({
                                top: $(window)
                                    .height()
                            }, 200, "swing", function() {
                                return $(this)
                                    .hide(), $(".sidebar")
                                    .after(
                                        '<button class="show-list">show list</button>'
                                    ), $(".show-list")
                                    .click(function() {
                                        return $(".sidebar")
                                            .show(), $(
                                                ".sidebar")
                                            .animate({
                                                top: "275px"
                                            }, 200)
                                    })
                            })
                    }), "mobile" === e && (n = $("ol li")
                        .length, n % 2 === 1 && $("ol")
                        .append("<li></li>")), i = 6, $(".sidebar .time")
                    .each(function() {
                        var e, t, n, r, o, s, a, u, l, c, d, h, f, p;
                        return p = $(this)
                            .text()
                            .match(/[\x00-\x7F]*$/)
                            .join(), s = p.split(":"), t = parseInt(s[0]),
                            n = parseInt(s[1].substring(0, 2)), e = s[1]
                            .substring(2, 4), "pm" === e && (t += 12),
                            r = n / 60, o = t + r, a = new Date, u = a.getHours(),
                            l = a.getMinutes(), c = l / 60, d = u + c,
                            h = o - d, f = h / i * 100, $(this)
                            .replaceWith(
                                '      <div class="time-graph">        
                                            <p style="width:' + f + '%">
                                                <span>' + p + "</span>
                                            </p> 
                                        </div>")
                    }), 
                $(".show-user-location")
                    .click(function(t) {
                        return navigator.geolocation ? (t.preventDefault(),
                            t.stopPropagation(), r.locate(), r.on(
                                "locationfound", function(t) {
                                    var n, i, o, s, a;
                                    return $("#map")
                                        .trigger("click"), s = .01,
                                        "mobile" === e ? (n = 0, s = .03) 
                                        : n = "tablet" === e ? .0125 : .0175, a = [t.latlng
                                            .lat - s, t.latlng.lng -
                                            n], o = [t.latlng.lat +
                                            .01, t.latlng.lng], r.fitBounds(
                                            [a, o]), i = L.mapbox.featureLayer({
                                            type: "Feature",
                                            geometry: {
                                                type: "Point",
                                                coordinates: [t
                                                    .latlng
                                                    .lng, t
                                                    .latlng
                                                    .lat]
                                            },
                                            properties: {
                                                title: "you",
                                                "marker-color": "#9c2c2c",
                                                "marker-symbol": "star"
                                            }
                                        })
                                        .addTo(r), r.on("layeradd",
                                            function() {
                                                return $(
                                                        ".marker-title"
                                                    )
                                                    .parent()
                                                    .parent()
                                                    .parent()
                                                    .addClass(
                                                        "reduce-width"
                                                    )
                                            })
                                })) : ($("#map")
                            .before(
                                '<div class="alert alert-error"><button class="dismiss-button" type="button">&times;</button><p>Geolocation is not supported by your browser.</p></div>'
                            )
                            .prev()
                            .hide()
                            .fadeIn("fast"), $(".dismiss-button")
                            .click(function() {
                                return $(this)
                                    .parent()
                                    .fadeOut("fast", function() {
                                        return $(this)
                                            .remove()
                                    })
                            }))
                    })
            })
    }.call(this);