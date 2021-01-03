/*
 * @Description:app
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:21:14
 * @LastEditTime: 2020-12-29 11:41:35
 */

import 'package:get/get.dart';
import 'package:taojuwu/app/domain/repository/taojuwu/taojuwu_repository.dart';
import 'package:taojuwu/app/storage/taojuwu_storage.dart';
// import 'package:taojuwu/app/ui/pages/home/taojuwu_data.dart';
import 'package:taojuwu/app/xdio/x_dio.dart';

class TaojuwuController extends GetxController {
  TaojuwuRepository _repository = TaojuwuRepository();

  Future loadData() {
    return _repository.curtainProductAttrs().then((BaseResponse response) {
      if (response.isValid) {
        response.data.addAll({
          "-5": [
            {
              "id": 1,
              "type": -5,
              "k": "单窗",
              "picture": "single_window_pattern.png"
            },
            {
              "id": 2,
              "type": -5,
              "k": "L型窗",
              "picture": "L_window_pattern.png"
            },
            {
              "id": 3,
              "type": -5,
              "k": "U型窗",
              "picture": "U_window_pattern.png"
            },
          ],
          "-4": [
            {"id": 1, "type": -4, "k": "非飘窗", "picture": "not_bay_window.png"},
            {"id": 2, "type": -4, "k": "飘窗", "picture": "bay_window.png"},
          ],
          "-3": [
            {"id": 1, "type": -3, "k": "无盒", "picture": "window_no_can.png"},
            {"id": 2, "type": -3, "k": "有盒", "picture": "not_bay_window.png"}
          ],
          "-1": [
            {
              "name": "单窗/飘窗/无盒",
              "id": 13,
              "install_modes": [
                {
                  "name": "顶装满墙",
                  "img": "curtain/size_0100-1-1-SPW-H.png",
                  "is_checked": true
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "sub_options": [],
                  "index": 0
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "sub_options": [],
                  "index": 1
                }
              ]
            },
            {
              "name": "单窗/飘窗/有盒",
              "id": 22,
              "install_modes": [
                {
                  "name": "盒内装",
                  "img": "curtain/size_0110-1-1-SPY-H.png",
                  "is_checked": true
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "sub_options": [],
                  "index": 0
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "sub_options": [],
                  "index": 1
                }
              ]
            },
            {
              "name": "单窗/非飘窗/无盒",
              "id": 24,
              "install_modes": [
                {
                  "name": "顶装",
                  "img": "curtain/size_000011.png",
                  "is_checked": true
                },
                {
                  "name": "侧装",
                  "img": "curtain/size_000001.png",
                  "is_checked": false
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "sub_options": [],
                  "index": 0
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "sub_options": [],
                  "index": 1
                }
              ]
            },
            {
              "name": "单窗/非飘窗/有盒",
              "id": 23,
              "install_modes": [
                {
                  "name": "盒内装",
                  "img": "curtain/size_0010-1-1.png",
                  "is_checked": true
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "sub_options": [],
                  "index": 0
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "sub_options": [],
                  "index": 1
                }
              ]
            },
            {
              "name": "L型窗/非飘窗/无盒",
              "id": 18,
              "install_modes": [
                {
                  "name": "顶装",
                  "img": "curtain/size_100000.png",
                  "is_checked": true
                },
                {
                  "name": "侧装",
                  "img": "curtain/size_100010.png",
                  "is_checked": false
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "sub_options": [],
                  "index": 0
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "sub_options": [],
                  "index": 1
                },
                {
                  "name": "分墙面打开",
                  "is_checked": false,
                  "index": 2,
                  "sub_options": [
                    {
                      "title": "A面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "B面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "L型窗/非飘窗/有盒",
              "id": 15,
              "install_modes": [
                {
                  "name": "盒内装",
                  "img": "curtain/size_1010-1-1.png",
                  "is_checked": true
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "sub_options": [],
                  "index": 0
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "sub_options": [],
                  "index": 1
                },
                {
                  "name": "分墙面打开",
                  "is_checked": false,
                  "index": 2,
                  "sub_options": [
                    {
                      "title": "A面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "B面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "L型窗/飘窗/无盒",
              "id": 19,
              "install_modes": [
                {
                  "name": "顶装满墙",
                  "img": "curtain/size_1100-1-1.png",
                  "is_checked": true
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "index": 0,
                  "sub_options": []
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "index": 1,
                  "sub_options": []
                },
                {
                  "name": "分墙面打开",
                  "is_checked": false,
                  "index": 2,
                  "sub_options": [
                    {
                      "title": "A面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "B面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "L型窗/飘窗/有盒",
              "id": 19,
              "install_modes": [
                {
                  "name": "盒内装",
                  "img": "curtain/size_0110-1-1-LPY-H.png",
                  "is_checked": true
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "sub_options": [],
                  "index": 0
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "sub_options": [],
                  "index": 1
                },
                {
                  "name": "分墙面打开",
                  "is_checked": false,
                  "index": 2,
                  "sub_options": [
                    {
                      "title": "A面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "B面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "U型窗/非飘窗/无盒",
              "id": 21,
              "install_modes": [
                {
                  "name": "顶装",
                  "img": "curtain/size_200010.png",
                  "is_checked": true
                },
                {
                  "name": "侧装",
                  "img": "curtain/size_200000.png",
                  "is_checked": false
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "index": 0,
                  "sub_options": []
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "index": 1,
                  "sub_options": []
                },
                {
                  "name": "分墙面打开",
                  "is_checked": false,
                  "index": 2,
                  "sub_options": [
                    {
                      "title": "A面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "B面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "C面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "U型窗/非飘窗/有盒",
              "id": 17,
              "install_modes": [
                {
                  "name": "盒内装",
                  "img": "curtain/size_2010-1-1.png",
                  "is_checked": true
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "index": 0,
                  "sub_options": []
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "index": 1,
                  "sub_options": []
                },
                {
                  "name": "分墙面打开",
                  "is_checked": false,
                  "index": 2,
                  "sub_options": [
                    {
                      "title": "A面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "B面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "C面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "U型窗/飘窗/无盒",
              "id": 17,
              "install_modes": [
                {
                  "name": "顶装满墙",
                  "img": "curtain/size_2100-1-1.png",
                  "is_checked": true
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "index": 0,
                  "sub_options": []
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "index": 1,
                  "sub_options": []
                },
                {
                  "name": "分墙面打开",
                  "is_checked": false,
                  "index": 2,
                  "sub_options": [
                    {
                      "title": "A面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "B面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "C面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "U型窗/飘窗/有盒",
              "id": 16,
              "install_modes": [
                {
                  "name": "盒内装",
                  "img": "curtain/size_2110-1-1.png",
                  "is_checked": true
                }
              ],
              "open_modes": [
                {
                  "name": "整体对开",
                  "is_checked": true,
                  "index": 0,
                  "sub_options": []
                },
                {
                  "name": "整体单开",
                  "is_checked": false,
                  "index": 1,
                  "sub_options": []
                },
                {
                  "name": "分墙面打开",
                  "is_checked": false,
                  "index": 2,
                  "sub_options": [
                    {
                      "title": "A面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "B面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    },
                    {
                      "title": "C面打开方式",
                      "options": [
                        {"name": "单开", "is_checked": true},
                        {"name": "对开", "is_checked": false}
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        });
        TaojuwuStorageAccessor().shopCurtainProductAttrs = response.data;
      }
    });
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
