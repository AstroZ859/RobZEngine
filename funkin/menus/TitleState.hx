package funkin.menus;

import funkin.backend.MusicBeatState;

class TitleState extends MusicBeatState {
    override function create() {
        super.create();

        var text = new FlxText(0, 0, 0, "ROBZ ENGINE");
        text.setFormat(null, 32, FlxColor.WHITE, CENTER);
        text.screenCenter();
        add(text);
    }
}