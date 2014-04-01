/**
 * Copyright 1996-2013 Founder International Co.,Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @author kenshin
 */

package com.founder.fix.fixflow.core.impl.interceptor;


/**
 * @author kenshin
 */
public abstract class CommandInterceptor implements CommandExecutor {

  /** will be initialized by the {@link CommandInterceptorChains} */
  protected CommandExecutor next;

  public CommandExecutor getNext() {
    return next;
  }
  
  public void setNext(CommandExecutor next) {
    this.next = next;
  }
}
