import { URL } from '../cm';
import controller from './controller-visaDetail';
import service from './service-visaDetail';

export class VisaDetail extends JSpringClass {
  constructor (uniqId) {
    super(uniqId, controller, service);
  }
}
