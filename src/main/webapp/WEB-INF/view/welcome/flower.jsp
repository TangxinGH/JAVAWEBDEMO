<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>Leon Sans - Plants PIXI</title>
    <style>
        html,
        body {
            width: 100%;
            height: 100%;
            overflow: hidden;
            outline: 0;
            margin: 0;
            padding: 0;
            cursor: move;

        }
    </style>

    <script src="../fontanimation/hammer.min.js"></script>
    <script src="../fontanimation/TweenMax.min.js"></script>
    <script src="../fontanimation/pixi.min.js"></script>
    <script src="../fontanimation/dat.gui.js"></script>
</head>

<body>


<script src="../fontanimation/dist/leon.js"></script>
<script src="../fontanimation/js/util.js"></script>
<script>
    let container, loader, resource;
    let leafs = [], flowers = [];
    let leon, controll;
    const tintLeaf = [
        0xFFFFFF,
        0xFFFF00,
        0xccff00,
        0x00ff1e,
        0xffb300,
        0xa2ff00
    ];
    const tintFlower = [
        0xFFFFFF,
        0xffeea1,
        0xffa1a1,
        0xeca1ff,
        0xa1dbff,
        0xffa1d6,
        0xd2ffa1,
    ];

    function init() {
        generatePixi(0xffffff); /*背景颜色*/

        container = new PIXI.Container();

        stage.addChild(container);

        loader = new PIXI.Loader();
        loader.add('branch_long', '../fontanimation/data/branch_long.png')
            .add('branch_circle', '../fontanimation/data/branch_circle.png')
            .add('flower1', '../fontanimation/data/flower1.png')
            .add('flower2', '../fontanimation/data/flower2.png')
            .add('flower3', '../fontanimation/data/flower3.png')
            .add('leaf1', '../fontanimation/data/leaf1.png')
            .add('leaf2', '../fontanimation/data/leaf2.png');

        loader.load((loader, resources) => {
            resource = resources;

            flowers.push('flower1');
            flowers.push('flower2');
            flowers.push('flower3');

            leafs.push('leaf1');
            leafs.push('leaf1');
            leafs.push('leaf2');

            loaded();
        });
    }

    function loaded() {
        controll = {
            color: {},
        };

        leon = new LeonSans({
            text: 'welcome',
            size: getSize(400),
            weight: 2,
            pathGap: -1,
            tracking: 0,
            isPath: true
        });
        leon.on('update', (data) => {
            update(data);
        });
// gui 控制用的，不美观
        // const gui = new dat.GUI();
        // gui.add(leon, 'text');
        // gui.add(leon, 'tracking', -3, 10);

        window.addEventListener('resize', resize, false);
        requestAnimationFrame(animate);
    }

    function resize() {
        sw = document.body.clientWidth;
        sh = document.body.clientHeight;

        renderer.resize(sw, sh);
    }

    function update() {
        while(container.children[0]) {
            TweenMax.killTweensOf(container.children[0]);
            container.removeChild(container.children[0]);
        }

        let points, saveFlowers = [], saveLeafs = [];
        let total = leon.model.data.length;
        let i, j, j_total, d, pos;
        for (i = 0; i < total; i++) {
            d = leon.model.data[i];
            j_total = d.paths.length;
            points = [];
            for (j = 0; j < j_total; j++) {
                pos = d.paths[j];

                if (pos.type == 'a') {
                    const dot = new PIXI.Sprite(resource.branch_circle.texture);
                    dot.anchor.set(0.5);
                    dot.x = pos.x;
                    dot.y = pos.y;
                    const scale = 0.15 * leon.scale;
                    dot.scale.x = dot.scale.y = scale;
                    container.addChild(dot);
                } else if (pos.start == 1) {
                    if (points.length > 0) {
                        addBranch(points);
                    }
                    points = [];
                    points.push(new PIXI.Point(pos.x, pos.y));
                } else {
                    points.push(new PIXI.Point(pos.x, pos.y));
                }

                if (Math.random() > 0.99) {
                    saveFlowers.push(pos);
                }

                if (Math.random() > 0.84) {
                    saveLeafs.push(pos);
                }
            }

            if (points.length > 0) {
                addBranch(points);
            }
        }

        function addBranch(points) {
            const branch = new PIXI.SimpleRope(resource.branch_long.texture, points);
            container.addChild(branch);
        }

        total = saveLeafs.length;
        for (i = 0; i < total; i++) {
            pos = saveLeafs[i];
            d = leafs[Math.floor(0.5 + (Math.random()*(leafs.length-1)))];
            const leaf = new PIXI.Sprite(resource[d].texture);
            leaf.anchor.set(0.5, 1);
            leaf.x = pos.x;
            leaf.y = pos.y;
            const scale = 0.1 * (0.2 + Math.random() * (1.2 - 0.2)) * leon.scale;
            leaf.scale.x = leaf.scale.y = 0;
            leaf.rotation = (pos.rotation + (90 * (Math.PI / 180)) * (Math.random() > 0.5 ? 1 : -1)) + (Math.random() * (Math.PI / 2) - (Math.PI / 4));
            container.addChild(leaf);
            leaf.tint = tintLeaf[Math.floor(0.5 + (Math.random()*(tintLeaf.length-1)))];
            TweenMax.to(leaf.scale, 0.8, {
                delay: 0.004 * i,
                x: scale,
                y: scale,
                ease: Power3.easeOut
            });
        }

        total = saveFlowers.length;
        for (i = 0; i < total; i++) {
            pos = saveFlowers[i];
            d = flowers[Math.floor(0.5 + (Math.random()*(flowers.length-1)))];
            const flower = new PIXI.Sprite(resource[d].texture);
            flower.anchor.set(0.5);
            flower.x = pos.x;
            flower.y = pos.y;
            const scale = 0.04 * (0.6 + Math.random() * (1.2 - 0.6)) * leon.scale;
            flower.scale.x = flower.scale.y = 0;
            flower.rotation = Math.random() * Math.PI * 2;
            container.addChild(flower);
            flower.tint = tintFlower[Math.floor(0.5 + (Math.random()*(tintFlower.length-1)))];
            TweenMax.to(flower.scale, 0.8, {
                delay: 0.05 * i + 0.6,
                x: scale,
                y: scale,
                ease: Power3.easeOut
            });
        }
    }

    function animate(t) {
        requestAnimationFrame(animate);

        const x = (sw - leon.rect.w) / 2;
        const y = (sh - leon.rect.h) / 2;
        leon.position(x + moveX, y + moveY);

        renderer.render(stage);
    }

    window.onload = () => {
        init();
    };
</script>

</body>

</html>