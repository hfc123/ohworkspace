/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */
import { Button } from '@ohos.multimodalInput.mouseEvent';

/**
 * 文件名: Button
 * 创建日期: 2024/10/16
 * 作者: hfc
 * 描述:
 *
 * 版权信息: (c) 2024 Your Company. All rights reserved.
 *
 * 修改记录:
 * 日期         作者        修改内容
 * ---------------------------------------------------
 * 2024/10/16     hfc     初始版本
 */

export class MyButtonAttribute implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute?(instance: ButtonAttribute): void {
    instance.fontSize(18);
    instance.width('80%');
    instance.margin(10);
    instance.fontColor(Color.White);
  };
}